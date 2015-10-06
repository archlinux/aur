# Maintainer: knightzx <cuongvdtz@gmail.com>

pkgname=hakuneko
pkgver=1.3.9
pkgrel=1
pkgdesc="Manga Downloader for Linux and Windows"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hakuneko/"
license=('MIT')
depends=('wxgtk2.8' 'curl')
install=hakuneko.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_src.tar.gz)
md5sums=('a28bbfaca0e0c8bfdc35f2dceebf85c3')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}_src

  # Use wxgtk2.8
  sed -i 's/wx-config /wx-config-2.8 /' config_default.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd ${srcdir}/${pkgname}_${pkgver}_src

  install -d ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
