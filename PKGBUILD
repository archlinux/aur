# Maintainer: XNicON <xnicon@gmail.com>

pkgsubn=aic8800d80
pkgname=aic8800d80-dkms-git
pkgver=1.0.0.r177.g1a2ce4e
pkgrel=1
pkgver() {
  cd "$srcdir/aic8800d80"
  printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgdesc="Kernel modules for WIFI AX900 8800d80 / Tenda"
arch=('x86_64')
depends=("dkms")
url="https://github.com/shenmintao/aic8800d80"
license=('GPLv2')

source=(
  'git+https://github.com/shenmintao/aic8800d80.git'
)
sha512sums=(
  'SKIP'
)

build() {
  cd "${srcdir}"
}

package() {
  # Copy udev rules
  install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
  install -m 644 "${srcdir}/${pkgsubn}/aic.rules" "${pkgdir}/usr/lib/udev/rules.d/"

  # Copy device firmware
  install -dm 755 "${pkgdir}/usr/lib/firmware"
  cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}/fw/aic8800D80" "${pkgdir}/usr/lib/firmware"

  # Copy source and dkms config
  install -dm 755 "${pkgdir}/usr/src/"
  cp -dr --no-preserve=ownership "${srcdir}/${pkgsubn}" "${pkgdir}/usr/src/aic8800-$pkgver"
}
