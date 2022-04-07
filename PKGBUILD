# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=hererocks
pkgver=0.25.1
pkgrel=1
pkgdesc="Tool for installing Lua and LuaRocks locally"
arch=('any')
url="https://github.com/luarocks/hererocks"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luarocks/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd3769fb9f7ac944f67601575a6c0aad7118e89ebba418985a126c2412f1f9e0')

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
