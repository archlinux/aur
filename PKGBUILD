# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling.TerminalUI'
pkgname=python-${_pkgname,,}
pkgname=${pkgname/./-}
pkgver=1.5.9
pkgrel=1
pkgdesc="A set of helpers to implement a text user interface (TUI) in a terminal"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-colorama' 'python-pytooling')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d1c98eadf251e9b19e59cf81cf7e0fc88df16ab8179d8e7e57aa18c08f7683f')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
