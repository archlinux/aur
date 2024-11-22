# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-umatrix
pkgver=1.4.4
pkgrel=2
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed"
        "git+https://github.com/uBlockOrigin/uAssets.git")
b2sums=('8f62cdc8657489c347f35629713da0c3fd38cfb9ebd4292f0dc85601fde48c24c88c64ca5d3ab06c96ba67bbf60cc8bb28f52d3010530260c998b75baddb4dd8'
        'SKIP')
validpgpkeys=('603B28AA5D6CD687A554347425E1490B761470C2') # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uMatrix
  ./tools/make-firefox.sh all
  strip-nondeterminism -t zip dist/build/uMatrix.firefox.xpi
}

package() {
  install -Dm644 uMatrix/dist/build/uMatrix.firefox.xpi \
    "$pkgdir"/usr/lib/icecat/browser/extensions/uMatrix@raymondhill.net.xpi

  # symlinks for `icecat-bin`
  install -dm755 "$pkgdir"/opt/icecat/browser/extensions
  pushd "$pkgdir"/opt/icecat/browser/extensions
    ln -sv /usr/lib/icecat/browser/extensions/uMatrix@raymondhill.net.xpi .
  popd
}

# vim:set ft=sh ts=2 sw=2 et:
