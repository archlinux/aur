# Maintainer: Viačasłaŭ Chalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.57.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('d363c533756665da3a8286b1ccb48290a01d2f82d22e23e910e71d48188e43c709d21e790eaf194c9c82c0ea4815f302905672970664e0be19f8114855169579')
validpgpkeys=('603B28AA5D6CD687A554347425E1490B761470C2')  # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uBlock
  make firefox
  strip-nondeterminism -t zip dist/build/uBlock0.firefox.xpi
}

check() {
  cd uBlock
  make test
}

package() {
  cd uBlock
  install -Dm644 dist/build/uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
