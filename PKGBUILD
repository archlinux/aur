pkgname='perl-mojolicious-plugin-bcryptsecure'
pkgver='0.02'
pkgrel='1'
pkgdesc="Securely bcrypt and validate your passwords"
_dist='Mojolicious-Plugin-BcryptSecure'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-urandom' 'perl-crypt-eksblowfish' 'perl-mojolicious')
makedepends=('perl-mojolicious' 'perl-module-build-tiny')
url='http://search.cpan.org/dist/Mojolicious-Plugin-BcryptSecure'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRCHULO/$_dist-$pkgver.tar.gz")
sha512sums=('5eba8e910cef82229747007891edeb2e5cc1c73a732ca7e0c45adeca951272cf4c0371df929c31caab27f954369cffd55e2f7c2583fa22075266a3c52e53ab37')
_distdir="$_dist-$pkgver"

build() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd "$srcdir/$_distdir"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}

