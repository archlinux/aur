# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.37.1
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm')
source=("https://github.com/darkreader/darkreader/archive/v$pkgver/darkreader-v$pkgver.tar.gz")
b2sums=('cf763e3cf601b2962724f2163ed662020beb8f8d3f936a6566c298dde5155442ce2d6649fb1a11b9a67c170af212876b62ee786cf18ccb78f05ac37e47625af8')

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
