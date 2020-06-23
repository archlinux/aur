# CPAN Name  : Imager::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-imager-qrcode
pkgver=0.035
pkgrel=1
pkgdesc='Imager-QRCode for Perl'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Imager-QRCode'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-imager' 'qrencode')
makedepends=('perl-module-install')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KU/KURIHARA/Imager-QRCode-${pkgver}.tar.gz")
sha256sums=('2a848deba29eb3942c44709a6853e318acab0c468cbfedbb9baae54760032513')

build() {
	cd "Imager-QRCode-${pkgver}"

	export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "Imager-QRCode-${pkgver}"

	make test
}

package() {
	cd "Imager-QRCode-${pkgver}"

	make DESTDIR="${pkgdir}" install
	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

