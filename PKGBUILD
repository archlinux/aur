# Maintainer: redponike <proton (dot) me>
# Contributor:: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.8
pkgrel=3
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
sha256sums=('b07798a0ba49346a143983573faaf8ca349c52a94709f373a0d4617c04943c72')


build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    # Create the virtual environment, install the wheel, and run the tests
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest -vv
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
