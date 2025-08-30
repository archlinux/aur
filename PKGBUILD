# Maintainer: Simpson474

pkgname=evcc-bin
pkgver=0.207.5
pkgrel=1
pkgdesc="evcc is an extensible EV Charge Controller and home energy management system"
arch=(x86_64 armv7h aarch64)
url="https://evcc.io/"
license=('MIT')
conflicts=('evcc-git')
source=("https://raw.githubusercontent.com/evcc-io/evcc/master/LICENSE")
source_x86_64=("https://github.com/evcc-io/evcc/releases/download/${pkgver}/evcc_${pkgver}_amd64.deb")
source_armv7h=("https://github.com/evcc-io/evcc/releases/download/${pkgver}/evcc_${pkgver}_armhf.deb")
source_aarch64=("https://github.com/evcc-io/evcc/releases/download/${pkgver}/evcc_${pkgver}_arm64.deb")
sha256sums=('ad5866243ee44e5c929d68ed825ccc27af0f8d6f4e50b447d9ad01894761ccc4')
sha256sums_x86_64=('1b843251d944666b6c1552d69c79a536c45b7be9b920194c8df3975023724105')
sha256sums_armv7h=('6c8b1619e4cbd6c03738995599a2ce74ce34fb5bddc431b32ed1808a7e9e094a')
sha256sums_aarch64=('84358860307c2e2d945d9882299b1fbed4eeec60e0b1945707fc9274e83ac289')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  mv ${pkgdir}/lib ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf "g	evcc	-\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
