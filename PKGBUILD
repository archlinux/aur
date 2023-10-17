# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-stylus
pkgver=1.5.35
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
groups=('firefox-addons')
makedepends=('git' 'npm' 'strip-nondeterminism')
source=("https://github.com/openstyles/stylus/archive/v$pkgver/stylus-$pkgver.tar.gz")
md5sums=('92150511ed8327d4c1adc6696f952693')

prepare() {
  cd stylus-$pkgver
  git config --global url."https://github.com".insteadOf ssh://git@github.com
  npm ci
}

build() {
  cd stylus-$pkgver
  npm run zip
  strip-nondeterminism -t zip stylus-firefox-$pkgver.zip
}

package() {
  cd stylus-$pkgver
  install -Dm644 stylus-firefox-$pkgver.zip \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
