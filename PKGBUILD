# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Iterator
pkgname=perl-iterator
pkgver=0.03
pkgrel=1
pkgdesc="A general-purpose iterator class"
arch=(any)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(
	perl
	perl-exception-class
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/R/RO/ROODE/$_dist-$pkgver.tar.gz")
sha512sums=('c14a7952aa9dfbf2922ff5ce5091ae008221382130fce6d608808f61d8131366bd37a1dfe1f0ad9e802dd6ace14705e119535d0f037e33c4d9d478d397293b73')

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
