# Maintainer: Evan Chen <evan at evanchen.cc>
# Contributon: Brian Thompson <brianrobt at pm.me>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=1.7.1
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
options=('!emptydirs')
source=("https://github.com/htmlhint/HTMLHint/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1399b33b23f9e7b63a4e841b85f953ff5dc4e5f8933df30917d362d9d8fb61afff52d7ce2f474162b2a735c58875de4880ea99325eda6f7b1738f73f841d0d1f')

prepare() {
  cd "$_name-$pkgver"
  npm ci
}

build() {
  cd "$_name-$pkgver"
  npm run build
}

#check() {
#  cd "$_name-$pkgver"
#  npm test
#}

package() {
  cd "$_name-$pkgver"

  npm prune --production

  install -d "$pkgdir"/usr/bin
  ln -s ../lib/node_modules/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dt "$pkgdir"/usr/lib/node_modules/$pkgname/bin bin/$pkgname
  cp -r dist node_modules package.json "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
    {CHANGELOG,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}
