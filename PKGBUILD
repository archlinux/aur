# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.76.4
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('cbc1d1a515d8406269c8257021bd72b5f8a9c083626536896c61736d00819eafd9136a46d252e97edcd6fd96a04b9709664872a47d92138cba4be68a1b89c4fc')
validpgpkeys=('91BFC93FDEC1D00C365C061EF5630CAE62A14316')  # Raymond Hill <rhill@raymondhill.net>

build() {
  cd uBlock
  make firefox

  cd dist/build
  strip-nondeterminism -t zip uBlock0.firefox.xpi
}

package() {
  cd uBlock/dist/build
  install -Dm644 uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi

  # symlinks for `icecat-bin`
  install -dm755 "$pkgdir"/opt/icecat/browser/extensions
  pushd "$pkgdir"/opt/icecat/browser/extensions
    ln -sv /usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi .
  popd
}

# vim:set ft=sh ts=2 sw=2 et:
