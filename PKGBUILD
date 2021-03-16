# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=5.2.0r3
_pkgver=${pkgver/r/-r}
pkgrel=1
pkgdesc='Statically linked qemu-arm, qemu-armeb and qemu-aarch64 executables from Alpine'
arch=(x86_64)
url='https://alpinelinux.org/'
license=(GPL2)
install=$pkgname.install
source=("https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-aarch64-$_pkgver.apk"
  "https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-arm-$_pkgver.apk"
  "https://alpine.global.ssl.fastly.net/alpine/edge/community/x86_64/qemu-armeb-$_pkgver.apk"
  aarch64.binfmt arm.binfmt armeb.binfmt
)

package() {
  for arch in aarch64 arm armeb; do
    install -Dm755 usr/bin/qemu-"$arch" "$pkgdir/usr/bin/qemu-${arch}-static"
    install -Dm644 "${arch}".binfmt "$pkgdir/usr/lib/binfmt.d/${arch}.conf"
  done
}

sha256sums=('d521aa809b0f784d4649c588c42eaad83cf98d99fdfa57b9579b35263bb1b7fd'
            '02c28aa7e18f483c3416eda51f36279021a6ca72a7c22a0100cf40c7c386e026'
            '96c48009f7c28714038308d90247c2c9ce0e48d6384fa7c27cc79f28e538af3a'
            '234e4d432d03324c44c33b12b7e047ff8bb52e86002ea68029c9ec57057fac19'
            'd41900da17c56d7dddea5c0a908b97944502cc5b67fbd1eb9106734a0731b578'
            'b95b705037bce2176ff84812dfe00e67ddd5e03e244e81301131419576b03f6b')
