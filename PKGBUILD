# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=ciphey
pkgver=5.14.0
pkgrel=4
pkgdesc="Automated decryption tool"
arch=("any")
url="https://github.com/Ciphey/Ciphey"
license=("MIT")
depends=(
    "flake8"
    "python"
    "python-appdirs"
    "python-base58" #aur
    "python-base91" #aur
    "python-click"
    "python-loguru" #aur
    "python-mock"
    "python-pyaml"
    "python-pybase62" #aur
    "python-pylint"
    "python-pywhat" #aur
    "python-rich"
    "python-typing_inspect"
)
makedepends=(
    "python-setuptools"
    "python-poetry"
)
provides=("ciphey")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("42fd5ea5b462ab37cb2e6aed41c254e7ed44bb190fed9a3918e6bdd56d86e10f")

build() {
    cd "$srcdir/Ciphey-$pkgver"
    poetry build

    cd dist
    tar xf "ciphey-$pkgver.tar.gz"
    cd "ciphey-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/Ciphey-$pkgver/dist/ciphey-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/Ciphey-$pkgver/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
