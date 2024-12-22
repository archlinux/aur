# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.1.7
pkgrel=2
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
sha256sums=('8973a89b45e505f07d036633882fb23077f458db73b9751cf85c9663a2697877')

prepare() {
  cd "$pkgname-$pkgver"

  # Python 3.13
  cp -f requirements/py3.12.txt requirements/py3.13.txt 
}

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
