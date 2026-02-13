# Maintainer: munsternet <munsternet at ik dot me>

_npmname=cmake-js
pkgname=nodejs-cmake-js
pkgver=8.0.0
pkgrel=1
pkgdesc="CMake.js - a Node.js native addon build tool"
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
b2sums=('819a456e4c4eb31b13945e9f513451a1a40b438db54338931c0a6a777fc3d899f82bf20d6fef238145504e81c0ed2f44d2e0eb56c83830072b98461e9fcf1f2d')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
