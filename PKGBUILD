# Maintainer: Simpson474

pkgname=evcc-bin
pkgver=0.200.6
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
sha256sums_x86_64=('b940054a28e358a890c6ae57e46d10b59bfbec79e5ff14b3a90a4e686e32bf99')
sha256sums_armv7h=('9ebba6b65f47a5f68d2be0b90dfff76398ad7be09c0ba7d7df25538157783c5a')
sha256sums_aarch64=('35ff70a055a804e34938af037d7ce49529e1697a0ab3c1cb03c83cc61b47a8c6')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  mv ${pkgdir}/lib ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf "g	evcc	-\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
