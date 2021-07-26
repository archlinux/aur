# Contributor: John Regan <john@jrjrtech.com>
pkgname=perl-shiftjis-cp932-maputf
pkgver=1.03
pkgrel=1
pkgdesc='ShiftJIS::CP932::MapUTF - transcode between Microsoft CP932 and Unicode'
_dist=ShiftJIS-CP932-MapUTF
arch=('x86_64' 'i686')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/S/SA/SADAHIRO/${_dist}-${pkgver}.tar.gz")
md5sums=('fe938c560101ae442a0bc6fe5b5f4aca')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_USE_UNSAFE_INC=1 PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
