# Maintainer: éclairevoyant
# Contributor: Jakob Nixdorf <flocke at shadowice dot org>

pkgname=perl-struct-dumb
_dist='Struct-Dumb'
pkgver=0.14
pkgrel=1
pkgdesc="Make simple lightweight record-like structures"
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-data-dump' 'perl-module-build')
checkdepends=('perl-test2-suite')
optdepends=('perl-data-dump: print in serialised format')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PE/PEVANS/$_dist-$pkgver.tar.gz")
sha256sums=('13c148536b10e28c6e0b4e132f29e4ca6e69b5749059c44157a27e84a5459436')

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
