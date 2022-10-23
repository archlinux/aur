# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.59
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm' 'strip-nondeterminism')
source=("https://github.com/darkreader/darkreader/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('06ac8426a9667991e8e970fcf27a45478714370e83eb7ec7c4954137f3c774acafe79d33f90aa78d0a785ad6150a39ec5ae55605d9c56ed2e633b7c98171aa60')

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
