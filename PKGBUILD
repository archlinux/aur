# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=icecat-ublock-origin
pkgver=1.64.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=('any')
url=https://github.com/gorhill/uBlock
license=('GPL-3.0-or-later')
groups=('icecat-addons')
makedepends=('git' 'npm' 'python' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('8d92f444ff6dd37ed6d8aad54d76242ef47512a9f1ab47fa22e87f31152fe50fd662a207c095dbcc0160235bab67fdac80aff080f901a0a5e40c9fb636b07d92')
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

  # symlinks for `icecat-bin`
  install -dm755 "$pkgdir"/opt/icecat/browser/extensions
  pushd "$pkgdir"/opt/icecat/browser/extensions
    ln -sv /usr/lib/icecat/browser/extensions/uBlock0@raymondhill.net.xpi .
  popd
}

# vim:set ft=sh ts=2 sw=2 et:
