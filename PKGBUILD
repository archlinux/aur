# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-posix-atfork'
pkgver='0.04'
pkgrel='1'
pkgdesc="Hook registrations at fork(2)"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-sharedfork')
url='https://metacpan.org/pod/POSIX::AtFork'
source=("https://cpan.metacpan.org/authors/id/N/NI/NIKOLAS/POSIX-AtFork-$pkgver.tar.gz")
md5sums=('a7637380a7d7c4bfbc22544a0cfc5590')
sha512sums=('3de1510a48c32a1596d744a9bc4498406031bff65cdcd598bd701f88daaa566aa3e0cdcdb0817dc8284c14aafd23d00405aa8adb8bd9640a16c6da988d4902de')
_distdir="POSIX-AtFork-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
