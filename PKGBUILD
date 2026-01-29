# Maintainer: Qontinuum <qontinuum@monaco.mc>

pkgname=libro
pkgver=0.6.1
pkgrel=1
pkgdesc="Terminal based book tracking tool"
arch=(any)
url="https://github.com/mkaz/libro"
license=('MIT')
depends=("python-appdirs" "python-rich" "python-prompt_toolkit" "python-textual")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
checkdepends=("python-pytest")
source=("https://github.com/mkaz/libro/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('aa40e554ea192eac9b0985cdd7f85b8d07aad56e60f23112b67bcb6df757ac3405631b0c3cf62df2ff373da6b65c484312219d54cb20de26c969a3e6aa6b1663')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="src:$PYTHONPATH" pytest -vv
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
