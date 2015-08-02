# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Oliver Charles <oliver.g.charles@googlemail.com>

pkgname=perl-fcgi-procmanager
_cpanname="FCGI-ProcManager"
pkgver='0.24'
pkgrel='2'
pkgdesc="Functions for managing FastCGI applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.0')
url="http://search.cpan.org/~gbjk/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/$_cpanname-$pkgver.tar.gz")
md5sums=('0aa184b1e5339e0ad92f4c1439406304')


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
