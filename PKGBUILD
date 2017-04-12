# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-Prime-XS
cpanauthor=KRYDE
pkgname=perl-math-prime-xs
pkgver=0.27
pkgrel=1
pkgdesc="Detect and calculate prime numbers with deterministic tests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-params-validate')
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('70a40bcf0d6d1a88375c884aa3139207')
sha256sums=('19f7e9b95fbb29e4d103bc454325143674852e38435667dfe998629f40d13af8')
sha512sums=('0ee15e765e660d4e989bee726530d04e34d40289dc6945bc9aed885abf1957df417ffc04449adee0ca6b1bab127e4e9e0bffd562f669ca704b7acb8a481ed42b')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
