# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-nodeenv
pkgver=1.7.0
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://github.com/ekalinin/nodeenv"
license=('BSD')
arch=('any')
depends=('python38-setuptools' 'make')
optdepends=('nodejs: for --node=system')
checkdepends=('nodejs' 'python38-pytest-runner' 'python38-coverage' 'python38-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ekalinin/nodeenv/archive/$pkgver.tar.gz")
sha512sums=('1e3e4068591d51d8915de73ab0f82f04620ca628152ec5a454e7ad18001ff20b698f9818353c44b80200ab529d95fa3196a3dbc85f0c497ea49f60eaa5dc9ea7')

build() {
  cd nodeenv-$pkgver
  python3.8 setup.py build
}

check() {
  cd nodeenv-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd nodeenv-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
