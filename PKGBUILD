# CPAN Name: Text-vCard
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-text-vcard
pkgver=3.09
pkgrel=6
pkgdesc='Text-vCard for Perl'
arch=('any')
url='https://metacpan.org/release/Text-vCard/'
license=('PerlArtistic' 'GPL')
depends=('perl'
        'perl-file-slurp'
        'perl-moo'
        'perl-path-tiny'
        'perl-text-vfile-asdata'
        'perl-unicode-linebreak'
        'perl-uri')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/L/LL/LLAP/Text-vCard-${pkgver}.tar.gz")
sha256sums=('c1ff3b0b14a86d8146808bdc59d8d207f220120309ccf16decfb0dc236c144b0')

build() {
	cd "${srcdir}/Text-vCard-${pkgver}"
	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "${srcdir}/Text-vCard-${pkgver}"

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

