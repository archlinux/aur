# Maintainer: Brett Cornwall <ainola@archlinux.org

pkgname=python-oath
pkgver=1.4.4
pkgrel=2
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH"
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD-3-Clause')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/o/oath/oath-$pkgver.tar.gz")
sha256sums=('bd6b20d20f2c4e3f53523ee900211dca75aeeca72f4f5a9fd8dcacc175fe1c0b')

build() {
    cd "oath-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-oath() {
    cd "oath-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
