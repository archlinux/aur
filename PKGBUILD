# Contributor: Calimero <calimeroteknik at free dot fr>
# Maintainer: Laurent Hofer <laurenth at laurenth dot net>
pkgname=xcas
pkgver=1.2.0
pkgrel=15
pkgdesc="Computer Algebra System"
arch=('i686' 'x86_64')
url="http://www-fourier.ujf-grenoble.fr/~parisse/giac.html"
license=('GPL3')
depends=('fltk-xcas' 'mesa' 'mpfr' 'pari25' 'gsl' 'lapack' 'ntl' 'desktop-file-utils' 'hicolor-icon-theme' 'libao')
makedepends=('latex2html' 'readline') 
provides=('xcas' 'giac')
install=xcas.install
source=("http://www-fourier.ujf-grenoble.fr/~parisse/debian/dists/stable/main/source/giac_${pkgver}-${pkgrel}.tar.gz") 
md5sums=('0e67ec6ab189857b45c249eef9b92f05')

build() {
  CXXFLAGS="${CXXFLAGS} -fpermissive"
  CPPFLAGS="${CPPFLAGS} -O2"
  LDFLAGS="${LDFLAGS} -lX11"
  cd "$srcdir/giac-$pkgver"
  ./configure --prefix=/usr --disable-cocoa
  make
}

package() {
  cd "$srcdir/giac-$pkgver"
  make DESTDIR="$pkgdir/" install
}
