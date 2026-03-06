# Maintainer: Evan Chen <evan at evanchen.cc>
# Contributon: Brian Thompson <brianrobt at pm.me>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=1.9.2
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
options=('!emptydirs')
source=("https://github.com/htmlhint/HTMLHint/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ff3284ea9de585bb7f983ff8aee735ea94c4853877ae36e783ccbd05854cabeb3c656acb43057eaee6413642057595d9b07fc987ea83bef9f3644360bba8dea6')

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
