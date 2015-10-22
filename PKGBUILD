# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python2-kwant
pkgver=1.1.0
pkgrel=1
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('BSD')
depends=(python2 python2-scipy lapack blas python2-tinyarray)
optdepends=(
	'python2-matplotlib: needed for plotting support and the tutorial'
	'mumps: a sparse linear algebra library for speed up and memory usage reduction'
)
checkdepends=(python2-nose)
source=(
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz.asc
)
sha1sums=('a18131c57ebeb2b0052ddba6ffcd72f65913a1bf'
          'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

build() {
    cd "$srcdir/kwant-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/kwant-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/kwant-${pkgver}/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}

check() {
    cd  "$srcdir/kwant-$pkgver"
    python2 setup.py test
}
