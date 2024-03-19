# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=1.1.4
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
options=('!emptydirs')
source=("git+https://github.com/htmlhint/HTMLHint.git#tag=v$pkgver")
b2sums=('60e761e535aab029424984da6a53318542ece739f6941dad027d8ba575aa2e0414613bd0048d91433dd8b2435fa3a83b30bc2d8b3ccead8935061d8f6ad8a58c')

prepare() {
  cd $_name
  npm ci
}

build() {
  cd $_name
  npm run build
}

check() {
  cd $_name
  npm test
}

package() {
  cd $_name

  npm prune --production

  install -d "$pkgdir"/usr/bin
  ln -s ../lib/node_modules/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dt "$pkgdir"/usr/lib/node_modules/$pkgname/bin bin/$pkgname
  cp -r dist node_modules package.json "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
    {CHANGELOG,CONTRIBUTING,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}
