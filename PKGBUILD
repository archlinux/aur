# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-$_pkgname"
pkgver=2.3.0
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/parsita"
license=('MIT')
depends=('python' 'python-returns')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drhagen/parsita/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c03ede631579e138ef9227fc6f1caaa06e8ba61d8f21c75309c1afab31508edf')
b2sums=('1ecb7425f108630e0a0050d2b3166502aea6ea06d58d74f4131192c42115d64e030ca3f0d097cb048bb51481a533cd01df5fb8a52e4be79662ed7c768a2236bf')

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
