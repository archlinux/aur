# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Data-Validate-URI
pkgname=perl-data-validate-uri
pkgver=0.07
pkgrel=1
pkgdesc="common url validation methods"
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-data-validate-domain
	perl-data-validate-ip
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/S/SO/SONNEN/$_dist-$pkgver.tar.gz")
sha512sums=('6b51a6eec704072f22348bfe93b9eb3d76ca57adce3131fa54895756e4d24e99ae9ef0b384eada6ec8e9775ed25fcf469807cefee995028199c8325bda976b72')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
