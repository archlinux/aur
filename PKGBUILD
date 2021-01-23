# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar
pkgname=${_pkgname}-devel
pkgver=4.17.0
pkgrel=1
pkgdesc='file manager for xfce'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
groups=('xfce4-devel')
url='https://thunar.xfce.org'
depends=('desktop-file-utils' 'exo>=4.15.3' 'gtk3' 'hicolor-icon-theme' 'libgudev'
         'libexif' 'libnotify' 'libpng' 'libxfce4ui>=4.15.3' 'libxfce4util>=4.15.2')
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
sha256sums=('ad004f02d8bda692d76ec2a264e3e1121ae065f3d2ecc9cfe7dd82cd5c69f8a5')

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
