# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-b-hooks-op-check
_cpanname="B-Hooks-OP-Check"
pkgver=0.19
pkgrel=1
pkgdesc="Wrap OP check callbacks"
arch=('i686' 'x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~flora/$_cpanname/"
options=('!emptydirs')
depends=('perl>=5.5.0')
makedepends=('perl-extutils-depends')
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_cpanname-$pkgver.tar.gz")
md5sums=('a6af890eccb266f6ad9cb295eb7c570b')

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
	cd "$srcdir/$_cpanname-$pkgver"
	export \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
}

build() {
	prepareEnvironment
	/usr/bin/perl Makefile.PL
	make
}

check() {
	prepareEnvironment
	make test
}

package() {
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
