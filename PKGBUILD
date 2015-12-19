# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python-tinyarray
pkgver=1.1.0
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
depends=(python)
checkdepends=(python-nose)
source=(http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz
		http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz.asc)
sha1sums=('53dae25fd5ab985aff7e28a423e0a784a917ecb8'
          'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

build() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray-${pkgver}/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || return 1
}

check() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py test
}
