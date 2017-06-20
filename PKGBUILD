# Maintainer: André Miranda <andre42m@gmail.com>

pkgname=thunar-gtk3
pkgver=1.6.90
pkgrel=5
pkgdesc='Modern file manager for Xfce - GTK3 Version'
arch=('i686' 'x86_64')
license=('GPL')
url=https://github.com/andreldm/thunar
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'libgudev' 'gtk3' 'exo>=0.11.2' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('intltool' 'xfce4-panel' 'git' 'xfce4-dev-tools' 'python')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
            'xfce4-panel: for trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags')
provides=(thunar="${pkgver%%.r*}")
conflicts=(thunar)
install=$pkgname.install
source=("$pkgname::git://github.com/andreldm/thunar")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

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
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
