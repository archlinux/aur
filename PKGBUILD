# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=2.10.1r2
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
sha256sums=('89d0a4b4318dbd6a3fc19c502069cd580aebffd842edb92514834cbebd351812'
            '1a207a5624da2d39ada1a0032f5a95b8c6e8803ba00baaa8a0f4ce5c92f394e3'
            '22fd99391ae04e79adebb7b6911a5e461fc291f3ad788bbbb6f382505d3f584f'
            'b013b13d3b304a6d66c332828be3c93e8643c0c1ee217b0f1152d0c9dc78c059'
            '805ab50d386b5e17c5a072217ed8d49450df079fcb76d6826427cea5b862474f'
            'fdaa63e61e625457c7de848cbcec8e6c6864a3cd12d8c3ee8e24cdd861be32b0')

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}
