# Maintainer: Kyle McNally <kyle@kmcnally.net>
pkgname=snapraid-daemon
pkgver=1.8
pkgrel=1
pkgdesc="a background service for SnapRAID: always-on, health monitoring, power management, web ui, rest api, notifications"
arch=('x86_64' 'i686')
url="http://www.snapraid.it/"
license=('GPL3')
depends=('libutil-linux' 'glibc' 'snapraid>=14.4' 'zip')
optdepends=('zlib' 'zstd')
source=("https://github.com/amadvance/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('13fa3a766f4ec51673e180fedd7da308c8d29464db1dfa7a1817e57301b4c09e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="/usr" --sysconfdir="/etc"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" prefix="/usr" mandir="/usr/share/man" install
  install -D -m644 snapraidd.conf.example ${pkgdir}/etc/snapraidd.conf

  # documentation
  install -D -m644 snapraidd.conf.example ${pkgdir}/usr/share/snapraidd/snapraidd.conf.example
  install -D -m644 AUTHORS ${pkgdir}/usr/share/doc/snapraidd/AUTHORS
  install -D -m644 COPYING ${pkgdir}/usr/share/doc/snapraidd/COPYING
  install -D -m644 HISTORY ${pkgdir}/usr/share/doc/snapraidd/HISTORY
  install -D -m644 INSTALL ${pkgdir}/usr/share/doc/snapraidd/INSTALL
  install -D -m644 README ${pkgdir}/usr/share/doc/snapraidd/README
  install -D -m644 TODO ${pkgdir}/usr/share/doc/snapraidd/TODO
  install -D -m644 snapraidd.yaml ${pkgdir}/usr/share/doc/snapraidd/snapraidd.yaml
}
