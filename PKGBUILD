# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-tinyarray-git
pkgver=v1.2.0a1.r23.gf4a3de4
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
conflicts=('python-tinyarray')
provides=('python-tinyarray')
depends=(python)
checkdepends=(python-pytest)
makedepends=(git)
source=('tinyarray::git+https://gitlab.kwant-project.org/kwant/tinyarray.git')
sha256sums=('SKIP')

pkgver() {
  cd "tinyarray"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/tinyarray"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || return 1
}

check() {
    cd "$srcdir/tinyarray"
    python setup.py test
}
