# Maintainer: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar-git
pkgver=1.6.12.r96.g9d9ed111
pkgrel=1
pkgdesc='file manager for xfce'
arch=('i686' 'x86_64')
license=('GPL')
url='http://thunar.xfce.org'
groups=('xfce4-git')
depends=('desktop-file-utils' 'exo' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui' 'libxfce4util')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
	    'xfce4-panel: trash applet'
	    'tumbler: for thumbnail previews'
	    'thunar-volman: manages removable devices'
	    'thunar-archive-plugin: create and deflate archives'
	    'thunar-media-tags-plugin: view/edit id3/ogg tags')
provides=("thunar=${pkgver%%.r*}")
conflicts=('thunar')
source=("$pkgname::git+https://git.xfce.org/xfce/thunar")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed -e 's/^thunar.//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
    cd "$pkgname"
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-dbus \
        --enable-startup-notification \
        --enable-gudev \
        --enable-exif \
        --enable-pcre \
        --enable-gtk-doc \
        --disable-debug
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
