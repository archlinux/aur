# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: GPP <gergan@gmail.com>

_distname=Test-Most
pkgname=perl-${_distname,,}
pkgver=0.37
pkgrel=1
pkgdesc='Most commonly needed test functions and features'
arch=('any')
url='https://metacpan.org/release/Test-Most'
license=('PerlArtistic' 'GPL')
depends=('perl-exception-class' 'perl-test-deep' 'perl-test-differences' 'perl-test-exception' 'perl-test-warn')
source=("https://search.cpan.org/CPAN/authors/id/O/OV/OVID/$_distname-$pkgver.tar.gz")
sha256sums=('533370141eb9f18cf4ac380f6ded2ab57802a6e184008a80fd2304bfcc474fc7')

build() {
  cd "$_distname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="" PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "$_distname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
