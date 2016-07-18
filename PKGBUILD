_npmname=vinefeed
pkgname="nodejs-$_npmname"
pkgver=0.1.0
pkgrel=1
pkgdesc="RSS/Atom feed generator for Vine users"
arch=(any)
url="http://github.com/tremby/vinefeed"
license=('GPL')
depends=('nodejs' 'npm')
optdepends=()

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

pkgver() {
  cd "$_gitname"
  grep -Po '(?<="version": ").*(?=")' package.json | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  npm install -g --prefix "$pkgdir/usr" --production
  rmdir "$pkgdir/usr/etc"
}
