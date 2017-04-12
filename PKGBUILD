# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-Prime-XS
cpanauthor=KRYDE
pkgname=perl-math-prime-xs
pkgver='0.26'
pkgrel='1'
pkgdesc="Detect and calculate prime numbers with deterministic tests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-params-validate')
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('5bd7727093742cc85cd6c762422c98c8')
sha512sums=('4054114b320e15c349c6620fcd8b2ae6a94b590f2be2a6301577dae09aef3058f901cafd669ea9846c0b7adaaad46e18552cdf147c8412b297d96d5f3bbd6fa4')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
