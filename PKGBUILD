# Maintainer: Moritz Bunkus <moritz@bunkus.org>

# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-lock-file'
pkgver='1.03'
pkgrel='5'
pkgdesc="File locker with an automatic out-of-scope unlocking mechanism"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-log-any')
makedepends=('perl-ipc-system-simple' 'perl-test-class' 'perl-test-fatal' 'perl-test-warn')
url='https://metacpan.org/dist/Lock-File'
source=("http://search.cpan.org/CPAN/authors/id/M/MM/MMCLERIC/Lock-File-${pkgver}.tar.gz")
sha512sums=('bf385a5a057b74eb6a1a5536545104133241eea7db9ff636fb6b20792df8c7c9476ca6e39bea1f4b9a8924aa575a76d306f8f462be3906fe79359693f1069fb8')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Lock-File-${pkgver}"
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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
