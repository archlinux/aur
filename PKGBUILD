# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=2.12.0r3
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=(http://rsync.alpinelinux.org/alpine/v3.8/main/x86_64/qemu-aarch64-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.8/main/x86_64/qemu-arm-$_pkgver.apk
        http://rsync.alpinelinux.org/alpine/v3.8/main/x86_64/qemu-armeb-$_pkgver.apk
        aarch64.binfmt arm.binfmt armeb.binfmt
)
sha256sums=('3d91f0bf036af25b83e07e9cbd02bcb07628ba8667b73ff4310b4f6ac12c65db'
            'e75f35395a3104615b2b07531ee417fbf129b78be4be919eebbc0d035e80ba1f'
            'd1952260524dc96526090ee8ccdfe81dcd5bd51d5fe87bb0fbe5525a7467834f'
            'b013b13d3b304a6d66c332828be3c93e8643c0c1ee217b0f1152d0c9dc78c059'
            '805ab50d386b5e17c5a072217ed8d49450df079fcb76d6826427cea5b862474f'
            'fdaa63e61e625457c7de848cbcec8e6c6864a3cd12d8c3ee8e24cdd861be32b0')

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}
