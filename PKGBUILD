# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.62
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm' 'strip-nondeterminism')
source=("https://github.com/darkreader/darkreader/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8a92801ab95f2b5c78fded7844ad587814d6cceffdd9775bdba7b7240ace96656d3e81867e7383144360df9272665c7b1464de4f5dab611ddb8f21e730dd9ad2')

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
