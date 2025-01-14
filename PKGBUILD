# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-standard
pkgver=37.0.0
pkgrel=1
pkgdesc='Standard shareable config for stylelint'
arch=(any)
url=https://github.com/stylelint/stylelint-config-standard
license=(MIT)
depends=(
  stylelint
  stylelint-config-recommended
)
makedepends=(
  git
  npm
)
source=("git+$url.git#tag=$pkgver")
b2sums=('e55a0fe0c60421ec82ed5eff92cfb51319a147db5e89341405138aa2ce2d0d29f7bdf42f6ee4b5618a2f12f1415fa13cba4a56990c54b5e5b9233f6a8e82a05a')

prepare() {
  cd $pkgname
  npm ci
}

check() {
  cd $pkgname
  npm test
}

package() {
  cd $pkgname
  install -Dm644 -t "$pkgdir"/usr/lib/node_modules/$pkgname index.js \
    package.json
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
