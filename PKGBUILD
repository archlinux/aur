# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net>

pkgname='perl-ppi'
pkgver='1.224'
pkgrel='2'
pkgdesc="Parse, Analyze and Manipulate Perl (without perl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.30' 'perl-io-string>=1.07' 'perl-list-moreutils>=0.16' 'perl-params-util>=1.00' 'perl-task-weaken' 'perl>=5.6.0')
makedepends=('perl-class-inspector>=1.22' 'perl-file-remove>=1.42')
checkdepends=('perl-test-nowarnings>=0.084' 'perl-test-object>=0.07' 'perl-test-subcalls>=1.07' 'perl-test-deep')
url='http://search.mcpan.org/dist/PPI'
source=('http://search.mcpan.org/CPAN/authors/id/M/MI/MITHALDU/PPI-1.224.tar.gz')
md5sums=('527b70bb15263c4f3907d6d4b5be6dba')
sha512sums=('7c5f4a01b3d4a1e7e2f68d7e5c81368387fbe9a4cd2f20afc494706f742c9ba0b293747b692fb77af9a1457e077687c7d5217bf09137ab71bb50ba52da24431c')
_distdir="PPI-1.224"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd $_distdir
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd $_distdir
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd $_distdir
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
