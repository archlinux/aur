# Maintainer: éclairevoyant
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-metrics-any'
pkgver=0.08
pkgrel=1
pkgdesc="Abstract collection of monitoring metrics"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.014')
makedepends=('perl-module-build')
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Metrics-Any'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Metrics-Any-$pkgver.tar.gz")
sha512sums=('407346619b3837c4b952b4254a9d68e31d61170aedecbea9346675b843945999960e395ab372ea8cd57d3cc95989c492582c72ebd6d0d8c118a565e8e167443b')
_distdir="Metrics-Any-$pkgver"

build() {
	( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
	    PERL_AUTOINSTALL=--skipdeps                            \
	    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
	    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
	    MODULEBUILDRC=/dev/null

	  cd "$srcdir/$_distdir"
	  /usr/bin/perl Build.PL
	  /usr/bin/perl Build
	)
}

check() {
	cd "$srcdir/$_distdir"
	( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
	  /usr/bin/perl Build test
	)
}

package() {
	cd "$srcdir/$_distdir"
	/usr/bin/perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
