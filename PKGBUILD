# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=4.17.10
pkgrel=1
pkgdesc='File manager for Xfce (development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
groups=('xfce4-devel')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'exo>=4.17.0' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui>=4.17.6' 'libxfce4util>=4.17.2')
makedepends=('intltool' 'xfce4-panel' 'gtk-doc' 'gobject-introspection') # 'xfce4-dev-tools')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
	        'xfce4-panel: trash applet'
	        'tumbler: for thumbnail previews'
	        'thunar-volman: manages removable devices'
	        'thunar-archive-plugin: create and deflate archives'
	        'thunar-media-tags-plugin: view/edit id3/ogg tags')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('d664b24018e3a67bc0d06dab384d3e2ac9f3df84aa59e66a5ab1028e97ec0b0c')

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-gudev \
        --enable-exif \
        --enable-pcre \
        --enable-gtk-doc \
        --disable-debug
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
