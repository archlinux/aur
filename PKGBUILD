# Maintainer: munsternet <munsternet at ik dot me>

_npmname=cmake-js
pkgname=nodejs-cmake-js
pkgver=7.3.0
pkgrel=1
pkgdesc="CMake.js - a Node.js native addon build tool"
arch=('any')
url="https://github.com/cmake-js/cmake-js"
license=('MIT')
depends=('nodejs' 'cmake')
makedepends=('npm')
options=(!strip)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
b2sums=('4a9e9f552498277445c1cb2c0cbd7341c72b36f3fb1cc2d8b83459d1d805dc4026b5ca98de04346db35fb846558a2eab14d246b2c71f0bb8baa00aff9acd3d80')
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
