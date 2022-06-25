# Maintainer: Viachaslau Khalikin <viachaslau dot vinegret at hotmail dot com>

pkgname=icecat-ublock-origin
pkgver=1.43.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL3')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed"
        "git+https://github.com/uBlockOrigin/uAssets.git")
b2sums=('SKIP'
        'SKIP')
validpgpkeys=('603B28AA5D6CD687A554347425E1490B761470C2') # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uBlock
  ./tools/make-firefox.sh all
  strip-nondeterminism -t zip dist/build/uBlock0.firefox.xpi
}

check() {
  cd uBlock
  make test
}

package() {
  cd uBlock/dist/build
  install -Dm644 uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
