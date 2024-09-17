# Maintainer: Flammkuchen <aur at bbirkner dot de>
_pkgname=JavaScript-QuickJS
pkgname=perl-javascript-quickjs
pkgver=0.21
pkgrel=2
pkgdesc="Run JavaScript via QuickJS in Perl"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-extutils-makemaker-cpanfile' 'perl-file-slurper' 'perl-file-which' 'perl-test-deep' 'perl-test-failwarnings' 'perl-test-fatal' 'perl-types-serialiser')
url='https://metacpan.org/pod/JavaScript::QuickJS'
source=("https://cpan.metacpan.org/authors/id/F/FE/FELIPE/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4cc3488e506c2312b9f8b3410c09f9aed1d1ceeba5a115815256f2827b1e61246d6ff542cbe6d15d21b51f63c49e73c304815e9e3340516f15fb13c64d200b6d')
_distdir="${_pkgname}-${pkgver}"

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
