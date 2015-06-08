# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname='perl-lwp-protocol-connect'
_cpanname='LWP-Protocol-connect'
pkgver='6.09'
pkgrel='1'
pkgdesc='HTTPS via HTTP proxy support for LWP'
arch=('any')
url="http://search.cpan.org/~benning/$_cpanname-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-libwww' 'perl-lwp-protocol-https')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/B/BE/BENNING/$_cpanname-$pkgver.tar.gz")
md5sums=('05a768b428e7283b38635713327a47a3')

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

