# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.33
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm')
source=("https://github.com/darkreader/darkreader/archive/v$pkgver/darkreader-v$pkgver.tar.gz")
b2sums=('00ebad6d81d74c8069b3d07e5698584dde57018e290dc795a0a19c6acf5ca75f8dfa58e7c95e4e3efb5a88a1f3299af76f791649ad01ad1a503fb9a14495b960')

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
