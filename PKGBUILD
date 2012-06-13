# Maintainer: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-perl4-corelibs
pkgver=0.003
pkgrel=1
pkgdesc='libraries historically supplied with Perl 4'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.006')
url=https://metacpan.org/release/Perl4-CoreLibs
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-$pkgver.tar.gz")
md5sums=(f74747c234470a087871f564a5f5db15)
sha512sums=(213d5539ed79b73ab9613ac6ce384f04726df27379f4727a710d48fed2abbc88364ce90ec5819a8b6133ea66f223c68bd0b988ba2fdebcb9efdeee07ec5f4d17)
_dir="$srcdir/Perl4-CoreLibs-$pkgver"

build()
(
  cd "$_dir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  /usr/bin/perl Build.PL
  ./Build
)

check()
(
  cd "$_dir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build test
)

package()
(
  cd "$_dir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build install installdirs=vendor destdir="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
