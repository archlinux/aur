# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-mail-audit'
pkgver='2.228'
pkgrel="3"
pkgdesc="library for creating easy mail filters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
# Mail::Internet, Mail::Mailer, Mail::Send are part of MailTools; in Arch: perl-mailtools
depends=('perl-file-homedir>=0.61' 'perl-file-tempdir' 'perl-mailtools' 'perl-mail-pop3client' 'perl-mime-entity' 'perl-mime-parser' 'perl-parse-recdescent')
url='http://search.cpan.org/dist/Mail-Audit'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mail-Audit-2.228.tar.gz')
md5sums=('92b3911cf6d71d8fa0ccb1359711c48b')
sha512sums=('fa54f065db7aeedb0df7e59bbf2c9ef5972834f86ddce8193066f4806ee4cea629c724c434de244c2bdf4e6fc0a81309583369730d43c541118348a6f264eebf')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Mail-Audit-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
