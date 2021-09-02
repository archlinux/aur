# Maintainer: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname="image-optimizer"
_gitname=Image-Optimizer
pkgver=0.1.22
pkgrel=1
pkgdesc="Simple losless image optimizer build for Elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/gijsgoudzwaard/image-optimizer"
license=('MIT')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3' 'imagemagick' 'optipng' 'jpegoptim')
optdepends=('elementary-icon-theme')
makedepends=('git' 'desktop-file-utils' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'cmake')
options=('!libtool')
conflicts=('image-optimizer' 'image-optimizer-bzr')
provides=('image-optimizer')
source=("${pkgname}-${pkgver}::https://github.com/GijsGoudzwaard/Image-Optimizer/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('90d95c64e6372df46cc5154b094fc8c8791aa49eb76df109ff566c50dabbfb7d4370e4c2d1326c32a0012ebe4488ec7f05ea8a7c1d41cda19607f576f38d22a2')

build() {
    cd "${srcdir}/${_gitname}-${pkgver}/"
    meson build --prefix=${pkgdir}/usr
}

check() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    ninja test
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    ninja install
    rm "${pkgdir}/usr/share/applications/mimeinfo.cache"
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
