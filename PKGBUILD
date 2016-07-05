# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de

pkgname=perl-html-quoted
_cpanname="HTML-Quoted"
pkgver=0.03
pkgrel=3
pkgdesc="Extract structure of quoted HTML mail message"
arch=('any')
url="http://search.cpan.org/~ruz/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-html-parser')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RU/RUZ/$_cpanname-$pkgver.tar.gz")
sha256sums=('ec5eedcbbbf8fd0a91e95c2bf35fe6efe0e1faa4f64f18063b4c240c29d08175')

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
