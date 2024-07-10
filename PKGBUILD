# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.1.6
pkgrel=1
pkgdesc="A tool to generate requirements.txt for Python projects."
arch=('any')
url="https://github.com/Damnever/pigar"
license=('BSD-3-Clause')
depends=(
  'jupyter-nbformat'
  'python-aiohttp'
  'python-click'
  'python-colorama'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3877d8be08e4fcd6a1127ea454214005961eb26ef646ab6e592d659d9b82601e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  make run-tests
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
