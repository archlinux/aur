# Maintainer: noobping <hello@noobping.dev>

pkgname=alpine-minirootfs
pkgver=3.17.2
pkgrel=1
pkgdesc="Minimal root filesystem in a chroot"
arch=(x86_64)
url="https://alpinelinux.org/"
license=('MIT')
install=${pkgname}.install
depends=('coreutils' 'grep' 'util-linux' 'sh')
source=(
  "https://dl-cdn.alpinelinux.org/alpine/v${pkgver%.*}/releases/${arch}/${pkgname}-${pkgver}-${arch}.tar.gz"
  "https://dl-cdn.alpinelinux.org/alpine/v${pkgver%.*}/releases/${arch}/${pkgname}-${pkgver}-${arch}.tar.gz.asc"
  'enter-chroot.sh'
  'exit-chroot.sh'
)
sha256sums=(
  'b10fc6a33e462b9ccf704436071771051728d30f5d8b48adcddb9523c4c45328'
  '78c1271cb0c5221a7960223fba2487081a71929c74e9f59d7638090031acfe6b'
  'cec5f09c3994a6126f11c7a6115f4cabed9db0256d39bf3991d707d492709d07'
  'c2cf38600b814531e46f398aca6725d748ea0c36155e89a830600d31a5e716fd'
)
validpgpkeys=('0482D84022F52DF1C4E7CD43293ACD0907D9495A')

package() {
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  tar -xzf ${pkgname}-${pkgver}-${arch}.tar.gz -C ${pkgdir}/usr/share/${pkgname}
  install -Dm755 ${srcdir}/enter-chroot.sh ${pkgdir}/usr/bin/alpine
  install -Dm755 ${srcdir}/exit-chroot.sh ${pkgdir}/usr/share/${pkgname}/sbin/logout
}
