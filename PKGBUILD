# CPAN Name  : Module::Refresh
# Contributor: Daenyth
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-module-refresh
pkgver=0.18
pkgrel=1
pkgdesc="Perl module to refresh %INC files when updated on disk"
arch=("any")
license=("GPL" "PerlArtistic")
url="https://metacpan.org/release/Module-Refresh"
options=(!emptydirs)
depends=("perl")
checkdepends=("perl-path-class") # 'perl' provides 'perl-test-simple' and 'perl-file-temp'
source=(http://search.cpan.org/CPAN/authors/id/B/BP/BPS/Module-Refresh-0.18.tar.gz)
md5sums=("81ba8a9c17831b2326c4f76e8a7ba517")

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
	export PERL_USE_UNSAFE_INC=1
}

build() {
	cd Module-Refresh-0.18
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Module-Refresh-0.18
	sanitize
	make test
}

package() {
	cd Module-Refresh-0.18
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
