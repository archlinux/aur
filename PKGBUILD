# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-faicons
_pkgname=faicons
pkgver=0.2.2
pkgrel=1
pkgdesc="An interface to Font-Awesome for use in Shiny"
arch=('any')
url="https://github.com/rstudio/py-faicons"
license=('MIT')
depends=(
    'python'
    'python-htmltools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6b7d7b19180179b6b83783f91bf6c9311c0f00ae0f97d41be1d24d9942361659')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=. pytest
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
