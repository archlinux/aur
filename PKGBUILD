# Maintainer: Evan Chen <evan at evanchen.cc>
# Contributon: Brian Thompson <brianrobt at pm.me>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=1.8.0
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
options=('!emptydirs')
source=("https://github.com/htmlhint/HTMLHint/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8f29f8f4e1c0747a5c2019449039b2acf7146ff804dd2560fa38ff6166424df30e1d62a5c534a0d048cfd90fa1431d965d0eda87abc43ea90c02404f71528e93')

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
