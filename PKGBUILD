# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>

pkgname=icecat-umatrix
pkgver=1.4.4
pkgrel=1
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
groups=('icecat-addons')
makedepends=('git' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed"
        "git+https://github.com/uBlockOrigin/uAssets.git")
b2sums=('SKIP'
        'SKIP')
validpgpkeys=('603B28AA5D6CD687A554347425E1490B761470C2') # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uMatrix
  ./tools/make-firefox.sh all
  strip-nondeterminism -t zip dist/build/uMatrix.firefox.xpi
}

package() {
  cd uMatrix/dist/build
  install -Dm644 uMatrix.firefox.xpi \
    "$pkgdir"/usr/lib/icecat/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ft=sh ts=2 sw=2 et:
