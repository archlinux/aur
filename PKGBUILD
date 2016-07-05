# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-html-mason-psgihandler
_cpanname="HTML-Mason-PSGIHandler"
pkgver=0.52
pkgrel=3
pkgdesc="PSGI handler for HTML::Mason"
arch=('any')
url="http://search.cpan.org/~abh/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0' 'perl-cgi-psgi' 'perl-plack')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AB/ABH/$_cpanname-$pkgver.tar.gz")
sha256sums=('e48e4362f983871da804b497a7ac176d6bffb503ea958ae92c8fb768af967157')

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
