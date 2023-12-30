# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc='File manager for Xfce (development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
groups=('xfce4-devel')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'exo>=4.19.0' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui' 'libxfce4util')
makedepends=('xfce4-panel' 'gtk-doc' 'gobject-introspection')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
            'xfce4-panel: trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags'
            'catfish: file search')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('2a5705d91d00a40fced036e185fcc40cae93c4e64ad2507047a6d36c93ad6df2')

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
    make DESTDIR="${pkgdir}" install
}
