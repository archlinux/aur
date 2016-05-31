# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=swac-record
pkgver=0.4
pkgrel=1
pkgdesc="A program for systematically recording words or expressions"
arch=('i686' 'x86_64')
url="http://zmoo.fr/swac-tools/swac-record.php"
license=('GPL3')
depends=('qt4' 'portaudio')
source=("http://zmoo.fr/download/${pkgname}-${pkgver}.tar.gz"
        "fix-flac-libs.patch"
        "set-target-path.patch"
        "swac-record.desktop")
md5sums=('dc128742664b65a97f49b00ed2c78da9'
         '28ba6df7586ae7a80daa8240b0356a08'
         '5904a3b1365a24c7cc5984bae324b962'
         '8bdbf179e7f7b2861b358f01bb7ff76f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/fix-flac-libs.patch"
  patch -Np1 < "${srcdir}/set-target-path.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make install INSTALL_ROOT=$pkgdir
  install -Dm644 "${srcdir}/swac-record.desktop" "${pkgdir}/usr/share/applications/swac-record.desktop"
}
