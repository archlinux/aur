# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python38-tomli
pkgver=2.0.1
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a467f8d48cdbd7213bd9b6f85fd48ba142ab7c9656c40bb30785e1c4b37a9e29eaed420f183458ad20112baee8413ebbec87755332795c8f02235d1018c3aa5c')

build() {
  cd tomli-$pkgver
  python3.8 -m build -wn --skip-dependency-check
}

check() {
  cd tomli-$pkgver
  PYTHONPATH="$PWD"/src python -m unittest
}

package() {
  cd tomli-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

