# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.2.0
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
  'python-cryptography'
  'python-docutils'
  'python-filelock'
  'python-keyring'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ef1822417f473e8d74562dbe04d953415fc403920a65dfc782249c7d6a782415')

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
