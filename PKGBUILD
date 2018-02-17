# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=1.7.1
pkgrel=1
pkgdesc='file manager for xfce'
arch=('i686' 'x86_64')
license=('GPL')
url='http://thunar.xfce.org'
groups=('xfce4-devel')
depends=('desktop-file-utils' 'exo' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui' 'libxfce4util')
makedepends=('intltool' 'xfce4-panel' 'gtk-doc' 'gobject-introspection') # 'xfce4-dev-tools')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
	        'xfce4-panel: trash applet'
	        'tumbler: for thumbnail previews'
	        'thunar-volman: manages removable devices'
	        'thunar-archive-plugin-git: create and deflate archives'
	        'thunar-media-tags-plugin-git: view/edit id3/ogg tags')
provides=("${_pkgname}=${pkgver}" 'libthunarx-3.so')
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("http://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname^}-${pkgver}.tar.bz2")
sha256sums=('c9b3b095b9e9cf8370cc30de46b6f559cdc29c92964c0899d94aaedac0f0186c')

prepare() {
    cd "${_pkgname^}-${pkgver}"
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
}

build() {
    cd "${_pkgname^}-${pkgver}"
    make
}

package() {
    cd "${_pkgname^}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
