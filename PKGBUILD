# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static-bin
pkgver=6.1.0r1
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=('x86_64')
url='https://alpinelinux.org/'
license=('GPL2')
install="${pkgname}.install"
source=("https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-aarch64-${_pkgver}.apk"
        "https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-arm-${_pkgver}.apk"
        "https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-armeb-${_pkgver}.apk"
        aarch64.binfmt arm.binfmt armeb.binfmt
)

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-"${arch}" \
      "${pkgdir}/usr/bin/qemu-${arch}-static"
    install -Dm644 "${arch}".binfmt \
      "${pkgdir}/usr/lib/binfmt.d/${arch}.conf"
  done
}

sha256sums=('296ffd6aeeba046409215a1f0f6ef246c4953835a1e3662cede8971d555b0bd4'
            'bcd8dcc23048dcafb3bb644d39b3338db58fbf1a626d586feb1e89b9f33d6af8'
            'c384c51495a08a6d21487f69699da66d8a9d406dc5a8b405359d14e72cfd3937'
            '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
            'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
            'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
