# Maintainer: Marc Mettke <marc@itmettke.de>
pkgname=nodejs-tiddlywiki-git
pkgver=v5.1.13.r378.gb9a8c3c01
pkgrel=1
pkgdesc="A non-linear personal web notebook"
url="http://tiddlywiki.com/"
arch=('any')
license=('BSD')
depends=('nodejs' 'npm')
conflicts=("nodejs-tiddlywiki")
source=(git+https://github.com/Jermolene/TiddlyWiki5.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/TiddlyWiki5"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/TiddlyWiki5"
  npm build
}

package() {
  cd "$srcdir/TiddlyWiki5"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$srcdir/TiddlyWiki5"
}
