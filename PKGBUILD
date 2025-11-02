# Maintainer: Simpson474

pkgname=evcc-bin
pkgver=0.209.6
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
sha256sums_x86_64=('17d234d973fa573cc85897f14c8d796c7856d757ea7238cf3a51149724544aa5')
sha256sums_armv7h=('c61de5e1b1fc03b23bc3e48e890904c1fa4f6c48c12a12bb3d2b6934b37be51e')
sha256sums_aarch64=('37f6e993c539ca13ce1fa783f643e8a57503a12bfd9e623e91176a61e4ee65f8')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  mv ${pkgdir}/lib ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf "g	evcc	-\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
