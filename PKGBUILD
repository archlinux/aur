# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=11
pkgrel=1
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('custom:WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
backup=('etc/butterrc')
source=("https://github.com/moviuro/butter/archive/${pkgver}.tar.gz")
sha256sums=('dfb010c11e6a2e15a976728028eead25027c8c1360ea7c35c3f82e3dd3ccb382')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr ETCDIR=${pkgdir}/etc \
    MANDIR=${pkgdir}/usr/share/man \
    LICENSEDIR=${pkgdir}/usr/share/licenses install

  ## If systemd is available, install the service as well
  if pacman -Qi systemd >/dev/null 2>&1; then
    install -Dm 0444 butter@.service \
      ${pkgdir}/usr/lib/systemd/system/butter@.service
  fi
}
