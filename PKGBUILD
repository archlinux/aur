# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: chimeracoder <dev@chimeracoder.net>

_distname=Hash-Merge-Simple
pkgname=perl-${_distname,,}
pkgver=0.052
pkgrel=1
pkgdesc='Recursively merge two or more hashes, simply'
arch=(any)
url="https://search.cpan.org/dist/$_distname"
license=(PerlArtistic GPL)
depends=(perl-clone)
checkdepends=(perl-test-most)
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/H/HA/HAARG/$_distname-$pkgver.tar.gz")
sha256sums=('c27f20895814a96e0c5bd0ca3315bf901d79706e3bab4ab0d946debc2c429c0b')

build() {
	cd "$_distname-$pkgver"
	export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$_distname-$pkgver"
	export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
	make test
}

package() {
	cd "$_distname-$pkgver"
	make install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
