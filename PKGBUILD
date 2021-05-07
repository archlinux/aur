# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=6.0.0r2
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

sha256sums=('d7fa5f09fb801b7ae79e13ab1561d6af14144e448f815ab37c50f0f93dc9f45c'
            '188f5f1bbe68e53739be6bf8130d7956bf99ec6fc31de0d7993f83ca44a11111'
            '1d32864afa077322aaee849c6eb711cfdffd91f246f1d0f8a11180158e523b9a'
            '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
            'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
            'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
