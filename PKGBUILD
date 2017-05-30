# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=2.8.1r1
_pkgver=${pkgver/r/-r}
pkgrel=2
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=(http://rsync.alpinelinux.org/alpine/v3.6/main/x86_64/qemu-aarch64-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.6/main/x86_64/qemu-arm-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.6/main/x86_64/qemu-armeb-$_pkgver.apk
        aarch64.binfmt arm.binfmt armeb.binfmt
)
sha256sums=('4a848f54612bf112277d4dee2460f96dce3c2c47a153ebbe199648335de2931b'
            '5cb691a4699365005347c01187a17042ee301f7d0b25f1640bb5b945cf7c09e2'
            'c82a104fe83ee136a7c8325c1ea34f293e5cdea32276d24e970ec5d0a6027387'
            'b013b13d3b304a6d66c332828be3c93e8643c0c1ee217b0f1152d0c9dc78c059'
            '805ab50d386b5e17c5a072217ed8d49450df079fcb76d6826427cea5b862474f'
            'fdaa63e61e625457c7de848cbcec8e6c6864a3cd12d8c3ee8e24cdd861be32b0')

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}
