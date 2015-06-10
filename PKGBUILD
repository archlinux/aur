# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-sys-fs
_cpanname=Sys-FS
pkgver=0.11
pkgrel=1
pkgdesc="Perl/CPAN Module Sys::FS - filesystem interaction tools"
arch=(any)
url="https://metacpan.org/release/$_cpanname"
license=(PerlArtistic)
options=('!emptydirs')
depends=(perl-log-tree perl-moose perl-namespace-autoclean perl-sys-run)
source=("http://cpan.metacpan.org/authors/id/T/TE/TEX/$_cpanname-$pkgver.tar.gz")
md5sums=('feea0f446f91e59c64c410b549814407')

build() {
	cd "$srcdir/$_cpanname-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}
package() {
	cd "$srcdir/$_cpanname-$pkgver"
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
