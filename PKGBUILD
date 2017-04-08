pkgname=qwt-qt4
pkgver=6.1.3
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (libqwt-qt4.so only)"
arch=('i686' 'x86_64')
url="http://qwt.sourceforge.net/"
depends=('qt4')
license=("custom:$pkgname")
source=("http://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.bz2" \
        "qwtconfig-archlinux.pri")
sha1sums=('90ec21bc42f7fae270482e1a0df3bc79cb10e5c7'
          '955f3702c5e8a847c545adf46745aade53626555')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # copy our config file to the right place
  cp ${srcdir}/qwtconfig-archlinux.pri qwtconfig.pri
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # build qwt:
  qmake-qt4 qwt.pro
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/lib/
  install -m 755 lib/libqwt.so.${pkgver} "${pkgdir}"/usr/lib/libqwt-qt4.so.${pkgver}
  ln -f -s libqwt-qt4.so.${pkgver} "${pkgdir}"/usr/lib/libqwt-qt4.so
  ln -f -s libqwt-qt4.so.${pkgver} "${pkgdir}"/usr/lib/libqwt-qt4.so.6
}
