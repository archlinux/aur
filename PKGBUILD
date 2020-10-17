# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=coil
pkgver=2.0.2
pkgrel=1
pkgdesc="CNI IPAM + intra-node routing plugin in favor of UNIX philosophy"
arch=('x86_64')
url="https://github.com/cybozu-go/coil"
license=('MIT')
makedepends=('go-pie' 'protobuf')
source=(
  "https://github.com/cybozu-go/coil/archive/v${pkgver}.tar.gz"
)

build() {
  cd "coil-$pkgver/v2"

  mkdir bin
  for x in coil coil-controller coil-egress coil-installer coil-router coild; do
    go build \
        -v \
        -trimpath \
        -ldflags "-w -s -extldflags $LDFLAGS" \
        -o ./bin/${x} ./cmd/${x}
  done
}

package() {
  cd "coil-$pkgver/v2/bin"
  install -Dm0755 coil "${pkgdir}/usr/bin/coil"
  install -Dm0755 coil-controller "${pkgdir}/usr/bin/coil-controller"
  install -Dm0755 coil-egress "${pkgdir}/usr/bin/coil-egress"
  install -Dm0755 coil-installer "${pkgdir}/usr/bin/coil-installer"
  install -Dm0755 coil-router "${pkgdir}/usr/bin/coil-router"
  install -Dm0755 coild "${pkgdir}/usr/bin/coild"
}
sha256sums=('3fd6bd1886d6357180dd9370be62fd1750db10bf9f1bb48318f5e5ec3e6dbc8d')
sha512sums=('41ea573750145bce84b0f1e4f191ce36c306784c6da662e250c823a43b22307c7fe491c9d59ae855adbeff08f0900a23c979bb2c166f814e2e1941a85dead971')
