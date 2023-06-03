# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-pureio
_pypi_pkgname=Adafruit_PureIO
pkgver=1.1.11
pkgrel=1
pkgdesc="Pure python (i.e. no native extensions) access to Linux IO including I2C and SPI. Drop in replacement for smbus and spidev modules"
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_PureIO"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python')
source=("https://pypi.io/packages/source/a/adafruit-pureio/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('c4cfbb365731942d1f1092a116f47dfdae0aef18c5b27f1072b5824ad5ea8c7c')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
