# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python2-tinyarray
pkgver=1.0.5
pkgrel=2
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
depends=(python2)
checkdepends=(python2-nose)
source=(http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz
		http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz.asc)
sha1sums=('8d802735027ca08793bab4fb37f2daa6c2fd0eaf'
          'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

build() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}

check() {
    cd "$srcdir/tinyarray-$pkgver"
    python2 setup.py test
}
