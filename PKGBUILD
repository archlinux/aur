# Maintainer: Nicolas FORMICHELLA <stigpro@outlook.fr>

pkgname="image-optimizer"
_gitname=Image-Optimizer
pkgver=0.1.20
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
b2sums=('61104b78824f5554113ce964896a9a310e338f362357d507826c01edbc91015a007f4bbf6a6dfdc3f277a95bc8d78c31caa87bb6f1093fc11b291116446829f1')

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
