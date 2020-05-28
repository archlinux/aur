# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_distname=Compress-BGZF
pkgname=perl-compress-bgzf
pkgver=0.006
pkgrel=1
pkgdesc="Read/write blocked GZIP (BGZF) files"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.012')
makedepends=()
options=('!emptydirs')
url="https://metacpan.org/release/$_distname"
source=("http://search.cpan.org/CPAN/authors/id/V/VO/VOLKENING/$_distname-$pkgver.tar.gz")
md5sums=('3a2f796f65efb09f9dc5e2db723b9ebd')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$_distname-$pkgver"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
