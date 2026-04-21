# Maintainer: Simpson474

pkgname=evcc-bin
pkgver=0.305.1
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
sha256sums_x86_64=('1c27989ebd41ab32949d82577c12a7076bf686e0e2fa486c9442d4c8c0a28bdc')
sha256sums_armv7h=('ae07f35cb2a9164033df66168e0735bb35c0036825dca0818d28ced86477b524')
sha256sums_aarch64=('07b2d6789c5edd6069e3ff0157695cbb992cba1820fca0abc371c53e53a16624')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  mv ${pkgdir}/lib ${pkgdir}/usr/
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  printf "g	evcc	-\nu       evcc    -:evcc  \"User for the evcc daemon\"    /dev/null       -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  printf "d /var/lib/evcc 0755 evcc evcc" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
