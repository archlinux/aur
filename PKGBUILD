# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.34
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm')
source=("https://github.com/darkreader/darkreader/archive/v$pkgver/darkreader-v$pkgver.tar.gz")
b2sums=('96faa077594277bf9f91ea2f12d219f77c29a81b8e2abd03d4493dc30be54c890b019c50dae147e95fc838742435191c5ecef1dab8fb414aa010f53c63935288')

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
