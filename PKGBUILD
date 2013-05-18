# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-linux-lvm2
_cpanname=Linux-LVM2
pkgver=0.12
pkgrel=1
pkgdesc="Perl/CPAN Module Linux::LVM2 - a Linux LVM2 wrapper"
arch=(any)
url="https://metacpan.org/release/$_cpanname"
license=(PerlArtistic)
options=('!emptydirs')
depends=(perl-moose perl-namespace-autoclean perl-sys-fs perl-sys-run perl-try-tiny)
source=("http://cpan.metacpan.org/authors/id/T/TE/TEX/$_cpanname-$pkgver.tar.gz")
md5sums=('760c147812c9641116bc6f8a0d81478a')

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
