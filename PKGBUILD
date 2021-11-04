# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.40
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm')
source=("https://github.com/darkreader/darkreader/archive/v$pkgver/darkreader-v$pkgver.tar.gz")
b2sums=('371622774aee3f15c50f7428eb60a0421412ce916a8cbb5daf51e9af0414e466b7d1c39cd39f652cf932569e95eaaa599c87eb354b4aea82120b5881fe83cee0')

build() {
  cd darkreader-$pkgver
  npm install --frozen-lockfile
  npm run build
}

check() {
  cd darkreader-$pkgver
  npm test
}

package() {
  groups=('librewolf-addons')
  cd darkreader-$pkgver
  install -Dm644 build-firefox.xpi \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi
}
