# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-moosex-event'
_pkgname='MooseX-Event'
pkgver='v0.2.0'
pkgrel='1'
pkgdesc="MooseX::Event - A Node style event Role for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0.15')
makedepends=('')
url="http://search.cpan.org/dist/MooseX-Event"
source=("http://search.cpan.org/CPAN/authors/id/W/WI/WINTER/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cd91d58d052d2bfdc99c56eb2f340d65')
sha512sums=('172abe452daab784f24f78f0a05836c18b28634c8281966066890a92be886d61569a9d5fbc3146ba2885149631c1a88fd0cd23ca625889c4392f71834555f7c3')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
