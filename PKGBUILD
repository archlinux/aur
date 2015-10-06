#
# swine PKGBUILD
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=swine
_pkgname=Swine
pkgver=1.0.4
pkgrel=2
pkgdesc="Graphical wine frontend"
arch=(any)
url="http://www.swine-tool.de/"
license=('GPL')
depends=('python2' 'wine' 'winetricks' 'pyqt' 'python2-pyqt4')
makedepends=('make')

source=(https://github.com/slackner/${_pkgname}/archive/${pkgver//_/-}.tar.gz
        swine.patch)

md5sums=('e737d69672e3b887e8924c13189eae42'
         'b03034fa25b98aefcc098465911f6d50')

pkg_name_ver="${_pkgname}-${pkgver//_/-}"

prepare() {
    cd "${srcdir}/${pkg_name_ver}"
    patch -Np0 -i "${srcdir}/../swine.patch"
}

build() {
    cd "${srcdir}/${pkg_name_ver}"
    make
}

package() {
    cd "${srcdir}/${pkg_name_ver}"
    make -j1 DESTDIR="${pkgdir}" install
}
