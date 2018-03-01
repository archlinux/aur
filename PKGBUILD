# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=2.10.1r3
_pkgver=${pkgver/r/-r}
pkgrel=2
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=(http://rsync.alpinelinux.org/alpine/v3.7/main/x86_64/qemu-aarch64-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.7/main/x86_64/qemu-arm-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.7/main/x86_64/qemu-armeb-$_pkgver.apk
        aarch64.binfmt arm.binfmt armeb.binfmt
)
sha256sums=('f2c993d6cecd2b5f5215955242eb028c7bf1c36e3773a469fa3b356745b9ed36'
            '6aca1475eef3149d0de57c1e7a54440a6aff515ff84c0f49ef01c92b00d250f6'
            'ce6078f3678ee89d28942160d56880574999cc057fb8b90fd9f76c3fc80c01ef'
            'b013b13d3b304a6d66c332828be3c93e8643c0c1ee217b0f1152d0c9dc78c059'
            '805ab50d386b5e17c5a072217ed8d49450df079fcb76d6826427cea5b862474f'
            'fdaa63e61e625457c7de848cbcec8e6c6864a3cd12d8c3ee8e24cdd861be32b0')

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}
