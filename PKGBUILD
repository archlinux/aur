# Maintainer: Kyle McNally <kyle@kmcnally.net>
pkgname=snapraid-daemon
pkgver=1.0
pkgrel=1
pkgdesc="a background service for SnapRAID: always-on, health monitoring, power management, web ui, rest api, notifications"
arch=('x86_64' 'i686')
url="http://www.snapraid.it/"
license=('GPL3')
depends=('libutil-linux' 'glibc' 'snapraid')
source=("https://github.com/amadvance/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('95c2f19c44cd4a2c08cac81d38d3fde4d0b2ebad2ea4e90c08999377b56108d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" prefix="/usr" mandir="/usr/share/man" install

  # documentation
  install -D -m644 snapraidd.conf.example ${pkgdir}/usr/share/${pkgname}/snapraidd.conf.example
  install -D -m644 AUTHORS ${pkgdir}/usr/share/doc/${pkgname}/AUTHORS
  install -D -m644 COPYING ${pkgdir}/usr/share/doc/${pkgname}/COPYING
  install -D -m644 HISTORY ${pkgdir}/usr/share/doc/${pkgname}/HISTORY
  install -D -m644 INSTALL ${pkgdir}/usr/share/doc/${pkgname}/INSTALL
  install -D -m644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -D -m644 TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
}
