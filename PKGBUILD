# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=coil
pkgver=1.1.8
pkgrel=2
pkgdesc="CNI IPAM + intra-node routing plugin in favor of UNIX philosophy"
arch=('x86_64')
url="https://github.com/cybozu-go/coil"
license=('MIT')
makedepends=('go-pie')
source=(
  "https://github.com/cybozu-go/coil/archive/v${pkgver}.tar.gz"
)

build() {
  cd "coil-$pkgver"

  go build \
      -v \
      -trimpath \
      -mod=vendor \
      -ldflags "-w -s -extldflags $LDFLAGS" \
      -o hypercoil ./pkg/hypercoil
}

package() {
  cd "coil-$pkgver"
  install -Dm0755 hypercoil "${pkgdir}/usr/bin/hypercoil"
  ln -s hypercoil "${pkgdir}/usr/bin/coil"
  ln -s hypercoil "${pkgdir}/usr/bin/coild"
  ln -s hypercoil "${pkgdir}/usr/bin/coil-controller"
  ln -s hypercoil "${pkgdir}/usr/bin/coilctl"
  ln -s hypercoil "${pkgdir}/usr/bin/coil-installer"
}
sha256sums=('bf6277f18bdc366cfbbe7a60a53cc136b2906eb6bab0a02d5ff0e9fee229f6cd')
sha512sums=('a37bb91295374ad1b501e5bf218222c3c0ca72442da3293bcf5303b5f4c8ba9af83c4bb979c766cc9f892c995a5fba807d52a429d2a6882bd042dc22a8daff36')
