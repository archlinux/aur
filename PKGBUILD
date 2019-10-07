# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tridactyl-git
pkgver=1.17.0.r12.gcfc9b24a
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/tridactyl/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
makedepends=('git' 'yarn')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd tridactyl
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd tridactyl
  yarn install --frozen-lockfile --non-interactive
  scripts/sign nosignbeta
}

package() {
  install -Dm644 tridactyl/web-ext-artifacts/tridactyl_beta-${pkgver%%.r*}.xpi "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim.betas@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
