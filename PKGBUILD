# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=HTMLHint
pkgname=htmlhint
pkgver=0.16.3
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
options=('!emptydirs')
source=("git+https://github.com/htmlhint/HTMLHint.git#tag=v$pkgver")
b2sums=('SKIP')

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

# vim:set ts=2 sw=2 et:
