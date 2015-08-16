# CPAN Name  : TOML
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-toml
pkgver=0.96
pkgrel=1
pkgdesc="Perl parser for Tom's Obvious, Minimal Language"
arch=('any')
url='https://metacpan.org/release/TOML'
license=('GPL2')
makedepends=('perl-module-build-tiny>=0.35')
depends=('perl-toml-parser>=0.04')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KARUPA/TOML-0.96.tar.gz)
options=(!emptydirs)
md5sums=('9f41f6dd1c6f015074261ef3a7b8b6f7')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd TOML-0.96
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd TOML-0.96
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd TOML-0.96
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
