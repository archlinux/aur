# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-msoffice-word-surgeon'
pkgver='2.11'
pkgrel='1'
pkgdesc="tamper with the guts of Microsoft docx documents, with regexes"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=(
  'perl-archive-zip'
  'perl-carp-object'
  'perl-match-simple'
  'perl-moose'
  'perl-moosex-strictconstructor'
  'perl-namespace-clean'
  'perl-xml-libxml'
)
url='https://metacpan.org/pod/MsOffice::Word::Surgeon'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAMI/MsOffice-Word-Surgeon-${pkgver}.tar.gz")
sha512sums=('d6f733ffa6022db885e76621737dde73b4d6ccf8f8bd5857caff23b76952f831e5d9fe6e369dde52ce6470c45c14b6e7b96cbe2bf08292732bc32d5295ae66ae')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/MsOffice-Word-Surgeon-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
