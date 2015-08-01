# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=pfclient
pkgver=3.0.2080
pkgrel=3
pkgdesc="Planefinder.net sharing client"
arch=('any')
url="https://planefinder.net/sharing/client"
license=(unknown)
optdepends=(
    "lib32-glibc: necessary for 64-bit systems"
    "lib32-gcc-libs: necessary for 64-bit systems"
)
install=pfclient.install

source=('pfclient.service') 
sha256sums=('db0cb3ad55568b259ba8be08709c37eb4c0aa2ca83f7417456b9f0d8dcd54d0a')

source_i686=("http://client.planefinder.net/pfclient_${pkgver}_i386.tar.gz")
sha256sums_i686=('46e25f75ff90edc61918bd3380591adeae5ec810a59c8e260ab38d5b8d79728d')

source_x86_64=("http://client.planefinder.net/pfclient_${pkgver}_i386.tar.gz")
sha256sums_x86_64=('46e25f75ff90edc61918bd3380591adeae5ec810a59c8e260ab38d5b8d79728d')

source_armv6h=("http://client.planefinder.net/pfclient_${pkgver}_armhf.tar.gz")
sha256sums_armv6h=('e32de0ca910d6e02fe10ffeb57adf0e4cc95ca585cefde5b4f6cf703578e6597')

source_armv7h=("http://client.planefinder.net/pfclient_${pkgver}_armhf.tar.gz")
sha256sums_armv7h=('e32de0ca910d6e02fe10ffeb57adf0e4cc95ca585cefde5b4f6cf703578e6597')

prepare() {
  if [[ $CARCH == 'i686' || $CARCH == 'x86_64' ]]; then
    __pfarch="i386"
  else
    __pfarch="armhf"
  fi
                      
  cd "$srcdir"
  tar -xzf pfclient_${pkgver}_$__pfarch.tar.gz
}

package() {
  install -Dm755 "${srcdir}/pfclient" "${pkgdir}/usr/bin/pfclient"
  install -Dm644 "${srcdir}/pfclient.service" "${pkgdir}/usr/lib/systemd/system/pfclient.service"
  install -Dm644 /dev/null "${pkgdir}/etc/pfclient/pfclient-config.json"
}

# vim:set ts=2 sw=2 et:
