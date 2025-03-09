# Maintainer: redponike <proton (dot) me>
# Contributor:: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.7
pkgrel=1
pkgdesc="Python module to format click help output nicely with Rich."
arch=('any')
url="https://github.com/ewels/rich-click"
license=('MIT')
depends=(
  python
  python-click
  python-rich
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7aca19a6e1ca58de53425024f06fbe9bbbe209720f6a0b59424b5c78c8953311')


build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=src pytest -vv
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
