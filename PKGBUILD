# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.70.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('d0c9f6644b9b8623a6a82f5e299e5807e1d6c339ec906ffc77a2c22bd4133de9906315819d9f0b3089b3f953c35b39d5a87a1fc5e70aa4249774b676fee37b6e')
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
