# Maintainer: éclairevoyant
# Contributor: Jakob Nixdorf <flocke at shadowice dot org>

pkgname=perl-struct-dumb
_dist='Struct-Dumb'
pkgver=0.13
pkgrel=1
pkgdesc="Make simple lightweight record-like structures"
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-data-dump' 'perl-module-build')
checkdepends=('perl-test-fatal' 'perl-test-pod')
optdepends=('perl-data-dump: print in serialised format')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha256sums=('2e40af8daac08f743e7d7c29a6d61484d3081a5928aeac23a70fa7e0b79dcde4')

build() {
	cd $_dist-$pkgver
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd $_dist-$pkgver
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd $_dist-$pkgver
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}
