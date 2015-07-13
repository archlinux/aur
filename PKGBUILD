# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-regexp-ipv6
_cpanname="Regexp-IPv6"
pkgver=0.03
pkgrel=1
pkgdesc="Regular expression for IPv6 addresses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.0')
url="http://search.cpan.org/~salva/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/$_cpanname-$pkgver.tar.gz")
sha256sums=('d542d17d75ce93631de8ba2156da0e0b58a755c409cd4a0d27a3873a26712ce2')

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
