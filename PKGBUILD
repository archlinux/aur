# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.51
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm' 'strip-nondeterminism')
source=("https://github.com/darkreader/darkreader/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7cae9e0766fcad442f5076d8f86851ebde7c527753412b30312cfa988fad61a57a5732392aa65fd32e52519af092e7ee9994dd365a9c7b8c46b6fb888719e639')

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
