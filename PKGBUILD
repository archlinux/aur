# Maintainer: éclairevoyant
# Contributor: Jakob Nixdorf <flocke at shadowice dot org>

pkgname=perl-io-async
_dist='IO-Async'
pkgver=0.802
pkgrel=2
pkgdesc="Asynchronous event-driven programming"
arch=('any')
url="https://metacpan.org/release/IO-Async"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-future' 'perl-struct-dumb')
makedepends=('perl-module-build')
checkdepends=('perl-future-io' 'perl-test-fatal' 'perl-test-identity' 'perl-test-metrics-any' 'perl-test-refcount')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha256sums=('e582731577767c47eac435ef2904663d4a750b0e6802a4a6189a37f0cb308738')

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
