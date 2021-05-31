# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=mathics-pygments
pkgver=1.0.2
pkgrel=1
pkgdesc="A pygments-based lexer and scanner for Mathics."
arch=("any")
url="https://github.com/Mathics3/mathics-pygments"
license=('custom')
groups=()
depends=("mathics-scanner>=1.2.0"
         "python-pygments>=2"
         "python-ujson")
checkdepends=("python-pytest")
backup=() # Do we have any config files?
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('70121208eb13be0d1795bda1890bfd7e3b856bbc2e0b9891119ca5ae97de51ac')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    # Test environment needs this -_-
    # Essentially they assume we've already been installed
    export PYTHONPATH="."
    pytest tests
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --prefix="usr/"
}

