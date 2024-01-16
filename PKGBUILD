# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=12
pkgrel=1
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('custom:WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
backup=('etc/butterrc')
source=("https://github.com/moviuro/butter/archive/${pkgver}.tar.gz")
sha256sums=('5a61f673751adf3f829adb5c8d8491c2d7e5da28dc522df9aa7ffce85609f1e2')

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
