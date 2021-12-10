# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.43
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm' 'strip-nondeterminism')
source=("https://github.com/darkreader/darkreader/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ba226d802bb637d9889b4f7c872a84303aba3f75d6105d1f2d4d81aeb284a088aa0d60f00759f7c1a144d3afc6900aec490c1700fdec922c316b307e87ff77a9')

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
