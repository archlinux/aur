
# Maintainer: Samuel Henrique De Morais Vitrio <samuelhenriquemoraisvitrio@gmail.com>
# Contributor: Mateus Moutinho Queiroz <mateusmoutinho01@gmail.com>

pkgname=serjaoberranteiro-server
pkgver=4
pkgrel=1
pkgdesc="Library for web development"
arch=('x86_64')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer"
license=('MIT')
depends=('lua' 'sed')
makedepends=('sed')
source=("https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/releases/download/V4/serjao_server.zip")
sha256sums=('733d21a33c098b877a7d35cd35976d851124debe0ba36bb36daab52c01dfb721')

build() {
  cd "$srcdir/serjao_berranteiro"

  lua_ver=$(lua -e 'print(_VERSION:match("%d+%.%d+"))')

  sed -i "3i path='$pkgdir/usr/lib/lua/$lua_ver/'" serjao_berranteiro.lua
}

package() {
  cd "$srcdir/serjao_berranteiro"

  lua_ver=$(lua -e 'print(_VERSION:match("%d+%.%d+"))')

  rm -f "$pkgdir/usr/lib/lua/$lua_ver/serjao_berranteiro.so"
  rm -f "$pkgdir/usr/share/lua/$lua_ver/serjao_berranteiro.lua"

  install -Dm755 serjao_berranteiro.so "$pkgdir/usr/lib/lua/$lua_ver/serjao_berranteiro.so"

  install -Dm644 serjao_berranteiro.lua "$pkgdir/usr/share/lua/$lua_ver/serjao_berranteiro.lua"
}


