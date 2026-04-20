# Maintainer: Kyle McNally <kyle@kmcnally.net>
pkgname=snapraid-daemon
pkgver=1.7
pkgrel=1
pkgdesc="a background service for SnapRAID: always-on, health monitoring, power management, web ui, rest api, notifications"
arch=('x86_64' 'i686')
url="http://www.snapraid.it/"
license=('GPL3')
depends=('libutil-linux' 'glibc' 'snapraid>=14.1')
optdepends=('zlib' 'zstd')
source=("https://github.com/amadvance/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2049626ea6137911d0d40ee8ba3dcedeb9233a5ab340deb25542d598622253f7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix="/usr" --sysconfdir="/etc"
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
