# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=hererocks
pkgver=0.25.1
pkgrel=2
pkgdesc="Tool for installing Lua and LuaRocks locally"
arch=(any)
url="https://github.com/luarocks/hererocks"
license=(MIT)
depends=(
  python-setuptools
  python-importlib-metadata
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/luarocks/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd3769fb9f7ac944f67601575a6c0aad7118e89ebba418985a126c2412f1f9e0')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
