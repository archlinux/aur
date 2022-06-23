# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-soupsieve'
_distname="${pkgname#python2-}"
pkgver=1.9.6
pkgrel=3
pkgdesc='A CSS4 selector implementation for Beautiful Soup (legacy Python 2 version)'
arch=('any')
url="https://github.com/facelessuser/${_distname}"
license=('MIT')
depends=(
    'python2'
    'python2-backports.functools_lru_cache'
)
makedepends=('python2-setuptools')
# checkdepends=('python2-pytest' 'python2-beautifulsoup4' 'python2-html5lib' 'python2-lxml')
_tarname="${_distname}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/facelessuser/${_distname}/archive/$pkgver.tar.gz")
b2sums=('2bd2f74e6974ad73c79c018f704fef600594c568471062c503a7fb1248e2cc1840011d31550f7573654f015016f0d3272778b0100e4701318a829f916f06698e')

build() {
    cd "${_tarname}"
    python2 setup.py build
}

# circular dependency on python2-beautifulsoup4
# check() {
#     cd "${_tarname}/build/"
#     py.test2
# }

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm 644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
