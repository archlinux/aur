# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.1.0
pkgrel=1
pkgdesc="A fantastic tool to generate requirements for your Python project, and more than that"
arch=('any')
url="https://github.com/Damnever/pigar"
license=('BSD')
depends=('jupyter-nbformat' 'python-aiohttp' 'python-click' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pip')
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b34bb5a2a504ae0e8d12339cab7e317916b0a4518cdc7b556e80827bb524efb1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"
#  make run-tests
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
