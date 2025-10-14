# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=hostscope
pkgver=8.0
pkgrel=1
pkgdesc="Linux system monitoring tool for multiple hosts"
arch=('x86_64' 'i686')
url="http://www.maier-komor.de/hostscope.html"
license=('GPL-2.0')
depends=('glibc' 'gcc-libs' 'ncurses')
makedepends=('make' 'gcc')
source=("http://www.maier-komor.de/hostscope/${pkgname}-V${pkgver}.tgz")
md5sums=('23f0b640f1c964239131fb233ac64f01')
sha1sums=('0870d42f7ab9fa6a912b53fe30d760cf238547c3')
sha256sums=('9b9d460fc182e03d5e225caa63f6737f769d2e4d6e76f244120ea88d64f4864b')

build() {
  cd ${srcdir}/${pkgname}-V${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-V${pkgver}

  make PREFIX="${pkgdir}/usr/" install

  mv -f "${pkgdir}/usr/etc" "${pkgdir}/"

  mv -f "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/sbin/"
}
