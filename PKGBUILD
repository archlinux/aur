# CPAN Name : Graph-Writer-DSM
# Contributor: Rafael Reggiani Manzo <rr.manzo@gmail.com>
# Template  : CPANPLUS::Dist::Arch

pkgname=perl-graph-writer-dsm
pkgver=0.008
pkgrel=1
pkgdesc="Write graph as a quadractic matrix N x N, where N is the number of vertices in the graph. It is useful to visualize graphs with at least 1k vertices."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-class' 'perl-test-file' 'perl-graph' 'perl-mojolicious'
         'perl-modern-perl' 'perl-test-tempdir' 'perl-test-most'
         'perl-chart-gnuplot' 'perl-list-moreutils' 'perl-module-install'
         'perl-graph-readwrite')
makedepends=()
checkdepends=('perl-test-tempdir-tiny' 'perl-alien-gnuplot')
url='http://search.cpan.org/~joenio/Graph-Writer-DSM-0.008/lib/Graph/Writer/DSM.pm'
_distdir="Graph-Writer-DSM"
source=("http://search.cpan.org/CPAN/authors/id/J/JO/JOENIO/$_distdir-$pkgver.tar.gz")
sha512sums=('a0819bdb9eefc9c0275a34a559d6bbf97b7cd6a93037309d819ce43930a2ff48742c373dd93d55dfb422534eeb7dcdd8a9f7950196115355957fc4a4d47b2f6d')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
