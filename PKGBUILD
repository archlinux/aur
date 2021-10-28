# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_rockname=liluat
_rockver=1.2.0
_rockrel=1

pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua51-$_rockname" "lua52-$_rockname" "lua53-$_rockname")
pkgver=$_rockver
pkgrel=1
pkgdesc='Lightweight Lua Template engine'
url='https://github.com/FSMaxB/liluat'
license=('MIT')
arch=(any)
makedepends=(luarocks lua lua51 lua52 lua53)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dfedc89a05a5b26f9ec2d52ea324eb5a9e69b81b2fde2528102d6f80d4ad0093')
b2sums=('e4acd9209c86088bd460384538a70887371add4d9a8538d6ae0ce87f5084abf48ac61b8442fccc6fdabdf40042f5bce4574d1389e2279d7408975b319e66ba7a')

_package() {
  depends+=("${pkgname%-*}")

  cd "$_rockname-$_rockver"

  local lua_version="$1"

  luarocks --lua-version="$lua_version" --tree="$pkgdir/usr" \
    make --deps-mode=none --no-manifest "$_rockname-$_rockver-$_rockrel.rockspec"

  rm -rf "$pkgdir/usr/bin" "$pkgdir/usr/lib/luarocks/rocks-$lua_version/$_rockname/$_rockver-$_rockrel/bin"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

package_lua-liluat() {
  _package 5.4
}

package_lua51-liluat() {
  _package 5.1
}

package_lua52-liluat() {
  _package 5.2
}

package_lua53-liluat() {
  _package 5.3
}
