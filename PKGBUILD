# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='perl-data-entropy'
_dist='Data-Entropy'
pkgver='0.007'
pkgrel='1'
pkgdesc="Contains the Data::Entropy module, a collection of fundamental algorithms that use entropy."
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-rijndael' 'perl-http-lite' 'perl-data-float' 'perl-params-classify')
makedepends=()
url="https://metacpan.org/release/$_dist"
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_dist-$pkgver.tar.gz")
md5sums=('8608fdbf690fc21caf170310134c892b')
sha512sums=('f845fabcac67ab16d44f8bbefa0fc09df171efd6cd9ae2f2ee7e189cbb707cf074705763a022941cbfdda5ab4e03b85eacdb7942a504644a40970c42b5a7e0b9')
_distdir="$_dist-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
