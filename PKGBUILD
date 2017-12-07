# Contributer: giacomogiorgianni@gmail.com 

pkgname=httraqt
name=HTTraQt
pkgver=1.4.9
pkgrel=1
pkgdesc="Is the clone from WinHTTrack tool. GUI is based on Qt5 libriaries."
arch=('i686' 'x86_64')
url="http://httraqt.sourceforge.net/"
depends=('qt5-multimedia' 'httrack>=3')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://freefr.dl.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
#options=('!strip')
license=('GPL')

prepare() {
  sed 's|USE_QT_VERSION 4|USE_QT_VERSION 5|g' -i "${pkgname}/CMakeLists.txt"
}

build() {
  cd "${srcdir}/$pkgname"
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  #sed -i "71s|includes|include|g" CMakeLists.txt 
  #sed -i "295s|opt->mms_maxtime|//opt->mms_maxtime|g" ${srcdir}/$pkgname/sources/main/options.cpp
  #cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make clean && make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  #mkdir -p ${pkgdir}/usr/{bin,share/{applications,pixmaps,$pkgname}}
  #install -p -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
  #cp -r {lang,help} "${pkgdir}/usr/share/$pkgname"
  #install -p -m644 "desktop/$pkgname.desktop" "${pkgdir}/usr/share/applications/"
  #install -Dm644 "sources/icons/$pkgname-32.xpm"  "$pkgdir/usr/share/pixmaps/$pkgname-32.xpm"
  make DESTDIR="$pkgdir" install
  install -m 0755 "${srcdir}/${pkgname}/build/$pkgname" "$pkgdir/usr/bin/"
  #mv $pkgdir/usr/share/httraqt/help $pkgdir/usr/share/doc/
}

md5sums=('61ed52ce2e12e5a0f974542a40b13f78')
