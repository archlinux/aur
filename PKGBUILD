# Maintainer: h8red  h8red at yandex dot ru
pkgname=kcollectd
pkgver=0.9
pkgrel=2.2
pkgdesc="Kcollectd is a small applications that allows to view rrd datacollections that have been created by collectd."
arch=('i686' 'x86_64')
url="http://www.forwiss.uni-passau.de/~berberic/Linux/kcollectd.html"
license=('LGPL')
groups=()
depends=('kdelibs' 'collectd' 'boost-libs' 'rrdtool')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://www.forwiss.uni-passau.de/~berberic/Linux/kcollectd/$pkgname-$pkgver.tar.gz
  http://ftp.de.debian.org/debian/pool/main/k/kcollectd/$pkgname'_'0.9-2.1.diff.gz
  default_source.patch
  fix_isnan_scope.patch
)
noextract=()
md5sums=('7fef4a660207b4c65520ee77334088fb'
  '7dc0a3be745aa5156946fe6c9cec5405'
  '0680cad562a4f157bc41fca56c6ac170'
  '99d5797e67331de96dbba9354241fba3')
build() {
  cd $srcdir
  patch -p0 -i $pkgname'_'0.9-2.1.diff
  patch -p0 -i default_source.patch
  patch -p0 -i fix_isnan_scope.patch
  cd $pkgname-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make -C build DESTDIR="$pkgdir/" install || return 1
}
