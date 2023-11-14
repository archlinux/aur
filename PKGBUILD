# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname='perl-test-classapi'
_module='Test-ClassAPI'
_author='E/ET/ETHER'
pkgver='1.07'
pkgrel='1'
pkgdesc='Provides basic first-pass API testing for large class trees'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
   'perl-class-inspector>=1.12'
   'perl-config-tiny>=2.00'
   'perl-params-util>=1.00'
)
url="https://metacpan.org/release/$_module"
source=("https://cpan.metacpan.org/authors/id/$_author/$_module-$pkgver.tar.gz")
sha256sums=('30e9dbfc5e0cc2ee14eae8f3465a908a710daecbd0a3ebdb2888fc4504fa18aa')

build() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
      perl Makefile.PL INSTALLDIRS='vendor'
      make
   )
}

check() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1'
      make test
   )
}

package() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      make install INSTALLDIRS='vendor' DESTDIR="$pkgdir"
      find "$pkgdir" -name .packlist     -delete
      find "$pkgdir" -name perllocal.pod -delete
      find "$pkgdir" -type d -empty      -delete
   )
}
