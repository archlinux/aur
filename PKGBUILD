# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname='perl-data-entropy'
_dist='Data-Entropy'
pkgver='0.008'
pkgrel='1'
pkgdesc="Contains the Data::Entropy module, a collection of fundamental algorithms that use entropy."
arch=('x86_64' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-rijndael' 'perl-http-lite' 'perl-data-float' 'perl-params-classify' 'perl-crypt-urandom')
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/R/RR/RRWO/$_dist-$pkgver.tar.gz")
md5sums=('378ed905d74a8b6a0bf03a045935a836')
sha512sums=('60f6d54e38a0b24343e7f595d21d1134f1c52bbcdf3224bdae53abcc1fda67cc7629b294b11c8d864f652768e629f2700cad96e0c66391f07117bfd445af197d')
_distdir="$_dist-$pkgver"

build() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_distdir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
