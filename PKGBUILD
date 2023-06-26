# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-$_pkgname"
pkgver=2.0.0
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/parsita"
license=('MIT')
depends=('python' 'python-returns')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drhagen/parsita/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4369851df6b4321df5bccaad846227843114ef1aba62ff0c25822fad82a0fdd')
b2sums=('08ea435ba9b8def246d4e2ba14c93f547d60e2a3686b97af9f125d99420bde55561b729f554bc16915ba3c69e524eb7a60a966ba823d2683bfe6e7629bf12632')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  export PYTHONPATH="src"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
