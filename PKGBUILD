# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
pkgname=fcdctl
pkgver=0.4.4
pkgrel=1
pkgdesc="A simple command line utility to set the frequency and gain of the Funcube Dongle SDR Receiver - Pro version"
url="http://www.oz9aec.net/index.php/funcube-dongle"
license=('GPL3')
source=(https://github.com/csete/fcdctl/archive/v${pkgver}.tar.gz)
sha512sums=('5ee17c4d5dc6203a311077c293bcfbd3d3d6ae2ae3adad6d3f891e88736508946c07774e3057fe03f19807960f99ccfe3eb9af62bd5821ff8c0a12d6c3f65cab')
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=()
conflicts=('fcdctlpp')

build() {
  cd $srcdir/fcdctl-${pkgver}
  make clean
  make
}

package() {
  cd $srcdir/fcdctl-${pkgver}
  install -m755 -D "$srcdir/fcdctl-${pkgver}/fcdctl" "$pkgdir/usr/bin/fcdctl"
  install -m755 -D "$srcdir/fcdctl-${pkgver}/funcube-dongle.rules" "$pkgdir/etc/udev/rules.d/68-funcube-dongle.rules"
}
