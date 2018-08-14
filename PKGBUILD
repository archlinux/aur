# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=pfclient
pkgver=4.1.1
pkgrel=1
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
sha256sums=('9346331884c38fcb669f1f40bd9461eeb7ed729f9f4600b3b47155e69536ddf5')

source_i686=("http://client.planefinder.net/pfclient_${pkgver}_i386.tar.gz")
sha256sums_i686=('8ed6740074eb0f0616f94919626f4056cf20bffe3046b49acc7c0a9ee9d98b30')

source_x86_64=("http://client.planefinder.net/pfclient_${pkgver}_i386.tar.gz")
sha256sums_x86_64=('8ed6740074eb0f0616f94919626f4056cf20bffe3046b49acc7c0a9ee9d98b30')

source_armv6h=("http://client.planefinder.net/pfclient_${pkgver}_armhf.tar.gz")
sha256sums_armv6h=('f262205d2aff125870a070312e44190786ac043fd2d3eba3bf7d2a3bb38f8928')

source_armv7h=("http://client.planefinder.net/pfclient_${pkgver}_armhf.tar.gz")
sha256sums_armv7h=('f262205d2aff125870a070312e44190786ac043fd2d3eba3bf7d2a3bb38f8928')

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
