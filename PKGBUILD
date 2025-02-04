# Maintainer: robertfoster

pkgname=icc_examin
pkgver=0.56
pkgrel=1
pkgdesc="ICC Examin is a colour management utility."
url="http://oyranos.org/"
arch=('i686' 'x86_64')
depends=('ftgl' 'fltk' 'openicc' 'oyranos')
optdepends=(argyllcms cinepaint-oyranos)
source=("https://github.com/oyranos-cms/icc-examin/archive/$pkgver.tar.gz"
  configure_tests.patch)
license=('MIT')

build() {
  cd $srcdir/icc-examin-$pkgver
  unset LDFLAGS
  patch -Np0 <"$srcdir"/configure_tests.patch
  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

sha256sums=('f939184e2e0552956363cd370d1502db59215ca43008c20fbfe64c60fa247333'
            '139d137a39915036c7eca0ca5642b9d0651d9053936b9cda41e6e88cd3766316')
