# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python-tinyarray
pkgver=1.2.3
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
depends=(python)
checkdepends=(python-pytest)
source=(http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz
		http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz.asc)
sha1sums=('ccc5712fb0c4b181c2060ad69c1345a4936ac7d7'
          'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

build() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray-${pkgver}/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || return 1
}

check() {
    cd "$srcdir/tinyarray-$pkgver"
    py.test
}
