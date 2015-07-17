# Maintainer: chimeracoder <dev@chimeracoder.net>

pkgname='perl-ppi'
pkgver='1.220'
pkgrel='1'
pkgdesc="Parse, Analyze and Manipulate Perl (without perl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.30' 'perl-io-string>=1.07' 'perl-list-moreutils>=0.16' 'perl-params-util>=1.00' 'perl-task-weaken' 'perl>=5.6.0')
makedepends=('perl-class-inspector>=1.22' 'perl-file-remove>=1.42')
checkdepends=('perl-test-nowarnings>=0.084' 'perl-test-object>=0.07' 'perl-test-subcalls>=1.07')
url='http://search.mcpan.org/dist/PPI'
source=('http://search.mcpan.org/CPAN/authors/id/M/MI/MITHALDU/PPI-1.220.tar.gz')
md5sums=('52224156144862b79b91fb53191ae47f')
sha512sums=('03ff865424a11cb351211dc7d57b6477848e8f354de74dc5bae214614438549f1dba6818842f6312f88fa631514abad69b0023046d56c8e8584d0b634c202694')
_distdir="PPI-1.220"

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
