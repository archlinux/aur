# Maintainer: RockrKnight <aquavicio[at]gmail[dot]com>
# Submitter: TDY <tdy[at]gmx[dot]com>

pkgname=qftp
pkgver=1.5.5
pkgrel=1
pkgdesc="QFtp is a user interface for Ftp file transfer."
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qftp&full=0"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt4' 'xcb-util-keysyms')
source=("http://hugo.pereira.free.fr/software/tgz/${pkgname}-${pkgver}.tar.gz"
	"qftp.desktop")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export LDFLAGS="-lX11" # Fix linking error.
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
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
sha256sums=('3fd029c81b042d7c941ae8126bd76d0350e1170e6124df634030f345e0fce38c'
            'f47e84a94e6be6361b56e581110e549cc7533ccca425f2a4ba98470dba43969b')
