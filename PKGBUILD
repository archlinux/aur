# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.61.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('d2a52732480a69fa3187faa30406d9079578e56ccb5ff3d72b4c390984200c72eca2ac07e7d9e1427e0517bc0812980e033ada0d7978590a551013f301e3d7e2')
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
