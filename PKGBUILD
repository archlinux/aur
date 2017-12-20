# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=solium
pkgver=1.1.0
_commit=2c8dcd9
pkgrel=1
pkgdesc='Linter to identify & fix Style & Security issues in Solidity'
arch=('any')
url='https://github.com/duaraghav8/Solium'
license=('MIT')
depends=(nodejs)
makedepends=(npm git)
source=("${pkgname}-${pkgver}::git+https://github.com/duaraghav8/Solium#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --production
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir"
  cp -R "$srcdir/$pkgname-$pkgver" "$_npmdir/solium"
  local _bindir="$pkgdir/usr/bin"
  mkdir -p "$_bindir"
  ln -s /usr/lib/node_modules/solium/bin/solium.js "$_bindir/solium"
}
