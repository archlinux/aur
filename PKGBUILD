# Maintainer: RockrKnight <aquavicio[at]gmail[dot]com>
# Submitter: TDY <tdy[at]gmx[dot]com>

pkgname=qftp
pkgver=1.5.8
pkgrel=1
pkgdesc="QFtp is a user interface for Ftp file transfer."
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qftp&full=0"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt5-base' 'xcb-util-keysyms')
makedepends=('cmake')
source=("http://hugo.pereira.free.fr/software/tgz/${pkgname}-${pkgver}.tar.gz"
	"qftp.desktop")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LDFLAGS="-lX11" # Fix linking error.
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT5=Yes
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
  install -d "${pkgdir}"/usr/share/{pixmaps,applications}
  install -m644 "${srcdir}"/qftp.desktop "${pkgdir}"/usr/share/applications
  install -m644 "${srcdir}"/"${pkgname}-${pkgver}"/qftp.png "${pkgdir}"/usr/share/pixmaps/qftp.png
}
sha256sums=('360666ad73d913c43140364897c59be25d8cbeb25e3e44fb64633a00e95f3c6d'
            'f47e84a94e6be6361b56e581110e549cc7533ccca425f2a4ba98470dba43969b')
