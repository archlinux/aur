# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Maintainer:  Simon Perry <aur [at] sanxion [dot] net>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-mail-gnupg'
_pkgname='Mail-GnuPG'
pkgver='0.21'
pkgrel='1'
pkgdesc="MIME Email <-> GnuPG::Interface interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-gnupg-interface' 'perl-mailtools' 'perl-mime-tools' 'perl-moox-late' 'perl-moox-handlesvia' 'perl-data-perl')
makedepends=('perl-test-pod')
url='http://search.cpan.org/dist/Mail-GnuPG'
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDB/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cdedb1a2fe67926e24b70f9e07d826096fb8cdb488703990b24663b8045189cf')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    perl Build.PL
    perl Build
  )
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    perl Build test
  )
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  perl Build install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
