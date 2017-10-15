# Maintainer: Flakebi <flakebi@t-online.de>
_pkgname=DBIx-Safe
pkgname=perl-dbix-safe
pkgver=1.2.5
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://bucardo.org/DBIx-Safe/"
license=('BSD')
options=(emptydirs)
source=("http://bucardo.org/downloads/$_pkgname-$pkgver.tar.gz")
md5sums=('738fd4e994e84bb5ca09908308e904c6')
sha256sums=('d44e52f3d555a974dad440adf680069f441de9e70806aa5104018b9769085dff')
_distdir="$_pkgname-$pkgver"

build() {
	(
		export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                   \
			PERL_AUTOINSTALL=--skipdeps                            \
			PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
			PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
			MODULEBUILDRC=/dev/null

		cd "$srcdir/$_distdir"
		/usr/bin/perl Makefile.PL
		make
	)
}

check() {
	cd "$srcdir/$_distdir"
	(
		export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
		make test
	)
}

package() {
	cd "$srcdir/$_distdir"
	make install

	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
