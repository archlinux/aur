# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=pigar
pkgver=2.0.6
pkgrel=1
pkgdesc="A fantastic tool to generate requirements for your Python project, and more than that"
arch=('any')
url="https://github.com/Damnever/pigar"
license=('BSD')
depends=('jupyter-nbformat' 'python-aiohttp' 'python-click' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
#checkdepends=('python-pip')
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d0ee40a67bf0ac3eecf228960b9a053df0b38128cd34c508d58a9705eac6c4d472105e74e3e10969cfa1628c0bcb5ac61a9b8cdd5c90259986c3765f606a1ecb')

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
