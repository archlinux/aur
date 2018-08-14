# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=2.12.0r3
_pkgver=${pkgver/r/-r}
pkgrel=2
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
            '28196e4d37bc67144db8c4840aee1945b734c4e6c2fbd27ae18a4f4ef0a002be'
            '41ff65086d8625cbf405dd267b7c240e21e4c2b12259c52d6dfa281899a7d1d3'
            'fe40aadf94d6c519d9c1e6950f5bf17f5862affbf4018b7e8367b5ca5f2d76fb')

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-$arch "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 ${arch}.binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}
