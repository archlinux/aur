# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-tridactyl-git
pkgver=1.21.1.r143.g5a11a97f
pkgrel=1
pkgdesc="Replace Firefox's control mechanism with one modelled on Vim"
url=https://github.com/tridactyl/tridactyl
arch=('any')
license=('Apache')
groups=('firefox-addons')
makedepends=('git' 'node-gyp' 'python' 'strip-nondeterminism' 'yarn')
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
  strip-nondeterminism -t zip web-ext-artifacts/tridactyl-$pkgver.xpi
}

package() {
  cd tridactyl
  install -Dm644 web-ext-artifacts/tridactyl_beta-${pkgver%%.r*}.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/tridactyl.vim.betas@cmcaine.co.uk.xpi
}

# vim:set ts=2 sw=2 et:
