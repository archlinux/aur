# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=5.2.0r4
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

sha256sums=('8e8ea5f3ae78453d8dca2a41c8d825acc6dca314c8973a2c98a77685aeeec3a3'
  '919aa9d023a0d26e3b73fdc75f407c0ef42fa1a2f91b289c1ae22edff1b9e78b'
  '441fdb4ec11ffdec901bbc14f823bab7ecc90bbb2b2092312fae936cd68ae3e1'
  '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
  'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
  'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
