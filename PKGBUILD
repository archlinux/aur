# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.76.6
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('866d73c129cc443995c0c791b2c6124b2027606847048f97950dadeee7b5d34f4dd54e8476f9fd648e6ff0a8fd883cc1caa4dcc3e3c910772d97ecb228d917d5')
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
