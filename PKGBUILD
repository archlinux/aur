# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.0.8
pkgrel=2
pkgdesc="A fantastic tool to generate requirements for your Python project, and more than that"
arch=('any')
url="https://github.com/Damnever/pigar"
license=('BSD')
depends=('jupyter-nbformat' 'python-aiohttp' 'python-click' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pip')
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('40c3a173373f88c3976c3193cfc6a77619584269b8d2aa57c09d250483aac180')

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
