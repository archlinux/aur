# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-stylus
pkgver=1.5.25
pkgrel=1
pkgdesc='Easily install themes and skins for many popular sites'
url=https://add0n.com/stylus.html
arch=('any')
license=('GPL3')
groups=('firefox-addons')
makedepends=('git' 'npm' 'strip-nondeterminism')
source=("https://github.com/openstyles/stylus/archive/v$pkgver/stylus-$pkgver.tar.gz")
md5sums=('5363c736c5f9e84598a7ef32dd387f6f')

prepare() {
  cd stylus-$pkgver
  git config --global url."https://github.com".insteadOf ssh://git@github.com
  npm ci
}

build() {
  cd stylus-$pkgver
  npm run zip
  strip-nondeterminism -t zip stylus.zip
}

package() {
  cd stylus-$pkgver
  install -Dm644 stylus.zip \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}.xpi
}

# vim:set ts=2 sw=2 et:
