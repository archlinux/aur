# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.50
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm' 'strip-nondeterminism')
source=("https://github.com/darkreader/darkreader/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a224c0fea54a3437ad6bb8ea333f1abb90c239448835819a94bfdc4497cc16d9167fcbdf03a156eb9b3cc3eb800432501a68112bda65db490a28d13fe1107adf')

prepare() {
  cd darkreader-$pkgver
  npm ci
}

build() {
  cd darkreader-$pkgver
  npm run build
  strip-nondeterminism -t zip build/release/*.xpi
}

package() {
  groups=('librewolf-addons')
  cd darkreader-$pkgver
  install -Dm644 build/release/darkreader-firefox.xpi \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi
}
