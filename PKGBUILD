# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.77.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('86428f704e3af298bd7df5ffd3caf6d26867b877aea244f32b7011ad2ff1a27c147ce6bbaf88816f2946f6e179f9475e38ef2a2b1b8405b56ce889a38cc2ea91')
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
