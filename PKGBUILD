# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-recommended
pkgver=15.0.0
pkgrel=1
pkgdesc='Recommended shareable config for stylelint'
arch=(any)
url=https://github.com/stylelint/stylelint-config-recommended
license=(MIT)
depends=(stylelint)
makedepends=(
  git
  npm
)
source=("git+$url.git#tag=$pkgver")
b2sums=('f8c2d2684684476ec8e5831c5bb6718bacac92446851b28216aadf1d1e798de45b203b9eff4aa3d46e76389a14ece7ee97d9fc77418726eedfc971942c13dbd8')

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
