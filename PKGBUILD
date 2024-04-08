# Maintainer: Viačasłaŭ Chalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.57.2
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('4d9815c11807e280ee43f255c7f97ac40e2657d7022a4107ff8f9989a2a0896c465d3503470de41a85cc9d05ea2f5cfd2169619beb17b0aca7419395dfd4a062')
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
