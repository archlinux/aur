# CPAN Name: Text-vCard
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-text-vcard
pkgver=3.07
pkgrel=2
pkgdesc='Text-vCard for Perl'
arch=('any')
url="http://search.cpan.org/~llap/Text-vCard/"
license=('PerlArtistic' 'GPL')
depends=('perl'
	'perl-file-slurp'
	'perl-io-stringy'
	'perl-moo'
	'perl-path-tiny'
	'perl-text-vfile-asdata'
	'perl-unicode-linebreak')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LL/LLAP/Text-vCard-${pkgver}.tar.gz")
sha256sums=('e722e014a9886ae0c9d54357b1d4ce95290ecfd6fbde13bef96a13232b0624aa')

build() {
	cd "${srcdir}/Text-vCard-${pkgver}"
	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/Text-vCard-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/Text-vCard-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

