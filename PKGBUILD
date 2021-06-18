# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=6.0.0r4
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

sha256sums=('1ba633cca4d230980ad3f65f42be2f92e110934424bc9cc0f93331a743ab9a4a'
            '9333bc8fa17e940edc2e2ffa38da73d3847e9fd13afa090d2a90b14f7613738d'
            '9450be63889b9cbca3e734e6790913aca04f8a26c4c02c8b2d7855ff9dd34eff'
            '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
            'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
            'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
