# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-text-wikiformat
_cpanname="Text-WikiFormat"
pkgver=0.79
pkgrel=2
pkgdesc="Module for translating Wiki formatted text into other formats"
arch=('any')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~chromatic/$_cpanname"
options=('!emptydirs')
depends=('perl>=5.5.0' 'perl-uri')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHROMATIC/$_cpanname-$pkgver.tar.gz")
sha256sums=('06fbc53818d764e04b3b26c39a325e074776d08dbc166c6043c4ec4b1b6bddb2')

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
