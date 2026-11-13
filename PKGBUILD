# Maintainer: jamezrin <mrjaime1999@gmail.com>
pkgname=outpace-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Open-source streaming engine for public Acestream content'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/outpace-stream/outpace-engine'
license=('AGPL-3.0-or-later')
optdepends=('ffmpeg: audio normalization and optional media processing')
provides=("outpace=${pkgver}")
conflicts=('outpace')
backup=('etc/outpace/outpace.env')
options=('!strip' '!debug')
source=('outpace.service' 'outpace.env' 'outpace.sysusers')
sha256sums=('4887ef4e711cfe14c818e10b6bbed036c63340dcae51b410c236e96b12f6acd2'
            '361db0601e330fa257451b2d0070956cfa12fcff317e7927b29747e5d833fef5'
            '1c8db166cd12f6b57566cdd28d8346ffbcc182cf4c0ad941465633d5a5c4c2bf')
source_x86_64=("${url}/releases/download/v${pkgver}/outpace-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e75ae33061213f5782787dbcb5883ddeb97f9c7b35b5054341a6b9cd5f6f8a2a')
source_aarch64=("${url}/releases/download/v${pkgver}/outpace-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('e909e59df99d93b09e9ae90c915f4b9ab7d4143dd3bb0aac40e8ad9e15e10284')
source_armv7h=("${url}/releases/download/v${pkgver}/outpace-${pkgver}-armv7-unknown-linux-musleabihf.tar.gz")
sha256sums_armv7h=('d619eb7ccb608f61345ecf2bc28c173703a0e9116dbbc2dd7b21a906d6062a80')
source_armv6h=("${url}/releases/download/v${pkgver}/outpace-${pkgver}-arm-unknown-linux-musleabihf.tar.gz")
sha256sums_armv6h=('ce956cd39e703e002608c3bfea68305c4f9b98266cce03264899abf08bcf4c48')
source_riscv64=("${url}/releases/download/v${pkgver}/outpace-${pkgver}-riscv64gc-unknown-linux-musl.tar.gz")
sha256sums_riscv64=('ba300dfb9dec270f546a82d76367385f480677e4878241a782a2f80d6ce61ea3')

package() {
  local target
  case "$CARCH" in
    x86_64) target=x86_64-unknown-linux-musl ;;
    aarch64) target=aarch64-unknown-linux-musl ;;
    armv7h) target=armv7-unknown-linux-musleabihf ;;
    armv6h) target=arm-unknown-linux-musleabihf ;;
    riscv64) target=riscv64gc-unknown-linux-musl ;;
  esac
  local release="outpace-${pkgver}-${target}"
  install -Dm755 "$release/outpace" "$pkgdir/usr/bin/outpace"
  install -Dm644 "$release/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$release/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 outpace.service "$pkgdir/usr/lib/systemd/system/outpace.service"
  install -Dm644 outpace.sysusers "$pkgdir/usr/lib/sysusers.d/outpace.conf"
  install -Dm644 outpace.env "$pkgdir/etc/outpace/outpace.env"
}
