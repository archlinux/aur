# Maintainer: Simpson474

pkgname=evcc-bin
pkgver=0.315.0
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
sha256sums=('c2c931924d5eb62fc90d393e3567a5f41ae249b71ff491abd4b3999cee09f194')
sha256sums_x86_64=('2827b1f9b9534d03c4bd0a2b56406e0253b107b055d8b8e4553158a4ed659457')
sha256sums_armv7h=('77882870e04cb0ddc227d19efd9bafcee681b056cbe3b3c9d587d03a6e2abf66')
sha256sums_aarch64=('8dda94b9b7cbf0fcb3cdce1ea775bea31cbdcc2df221dec92ca36a1bbb8647ab')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  mv ${pkgdir}/lib ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf "g	evcc	-\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
