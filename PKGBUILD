# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=hererocks
pkgver=0.23.0
pkgrel=1
pkgdesc="Tool for installing Lua and LuaRocks locally"
arch=('any')
url="https://github.com/luarocks/hererocks"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luarocks/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('433e7a44130a3f545f4931f65b34b060c1fb928ba4069677f955b07d59f1fa25c047096f10a97523944b44b0418916f7d83eedfa7e32e638bf620c6f4b16e014')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
