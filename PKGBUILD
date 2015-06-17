# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=perl-devel-coredumper
_cpanname=Devel-CoreDump
pkgver=0.02
pkgrel=1
pkgdesc='create core dumps of the running perl interpreter, without terminating'
arch=(any)
license=(BSD)
depends=(perl)
url='http://search.cpan.org/dist/$_cpanname/'
source=(http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/$_cpanname-$pkgver.tar.gz
        fixes.diff)
sha1sums=('9c062b63eaeaa5e01e0ed2f696d06b22a8c695be'
          '4b695e999b5c35c425458783722082776566158b')
prepare() {
  cd $_cpanname-$pkgver
  patch -p1 < "$srcdir/fixes.diff"
}

build() {
  cd $_cpanname-$pkgver
  perl Makefile.PL -- INSTALLDIRS=vendor
  make
}

check() {
  cd $_cpanname-$pkgver
#  make test
}

package() {
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
}
