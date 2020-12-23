# Maintainer: robertfoster
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=qemu-arm-static
pkgver=5.2.0r2
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

md5sums=('7c2bfb2b2edc2cf7d4f4655c670de0f7'
         '96283fb3e06e07cb6a2a5f4b983e22e6'
         '492498a6ffd9619e27d501183b9c8f24'
         '11c56ac5b0463055b7e3bc1216fe639e'
         '990e3e260665c1da56b5b1c71f480664'
         '89569b9c545af650dfeab24d4f8bb677')
