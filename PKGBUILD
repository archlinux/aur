# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.9.0
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=('any')
url=https://stylelint.io
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('stylelint-config-standard: for the standard shareable config')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('6ba746f54fc42950c7916635b717f3ef8851c0aee2f999b56ce52248d35225f9ba65306638c92c45b1e26f10aa09a2c532d55ba89334e44f53402f769303cc76')

package() {
  npm install --global \
              --user root \
              --prefix "$pkgdir"/usr \
              --production \
              $pkgname-$pkgver.tgz
  chown -R root:root "$pkgdir" # Workaround until npm >=7.4.0 hits repos
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -rs ../lib/node_modules/$pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
