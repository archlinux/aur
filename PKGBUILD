# Maintainer: gr m21 <grm21@protonmail.com>
_npmname=undollar
pkgname=undollar
pkgver=1.0.0
pkgrel=1
pkgdesc="undollar strips the dollar sign from the beginning of the terminal command you just copied from StackOverflow"
arch=(any)
url="https://github.com/xtyrrell/undollar"
license=(MIT)
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('561a2d2780c8bb912a5fc1499f7c16b9bfd5320af68a7a844515fe66d3de7dd0')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  # Fix NPM racecondition, also known as derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
