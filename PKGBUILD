# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static-bin
pkgver=7.0.0r1
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=('x86_64')
url='https://alpinelinux.org/'
license=('GPL2')
install="${pkgname}.install"
provides=('qemu-arm-static')
conflicts=('qemu-arm-static')
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

sha256sums=('14579046f88e2c0bebff95939028259cc68bd0e1da1409681d694fe267d5633e'
            '1673d7a41dcb646a2d925bdb0028d9cc313a9434f8996e4299189e441e285921'
            '69da8b57177ae0f9a1bd2d50e146c3c28a1f4e37053035aa472fe7a90cd8e875'
            '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
            'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
            'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
