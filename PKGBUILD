# Maintainer: Caleb Maclennan <caleb@alerque.com>

_distname=YAML-Merge-Simple
pkgname=perl-yaml-merge-simple
pkgver=0.01
pkgrel=8
_distrel=01
pkgdesc='Recursively merge two or more YAMLs, simply'
arch=('any')
url="https://github.com/andrefs/$_distname"
license=('PerlArtistic' 'GPL')
_perl_deps=(hash-merge-simple yaml-libyaml)
depends=(perl "${_perl_deps[@]/#/perl-}")
options=('!emptydirs')
_distdir="$_distname-${pkgver}_$_distrel"
source=("https://cpan.metacpan.org/authors/id/A/AN/ANDREFS/$_distdir.tar.gz")
sha256sums=('01ccfbd91b1ff3a3b1edd14f343cf61f6470c4036456a8bfa350eb211c9d0517')

build() {
	cd "$_distdir"
	export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$_distdir"
	export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
	make test
}

package() {
	cd "$_distdir"
	make install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
