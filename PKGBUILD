# CPAN Name  : Text::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-text-qrcode
pkgver=0.05
pkgrel=1
pkgdesc='Text-QRCode for Perl'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Text-QRCode'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-install')
depends=('perl' 'qrencode')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KU/KURIHARA/Text-QRCode-${pkgver}.tar.gz")
sha256sums=('0d5471bed596ddcd891df271c1b7983a4e39373c984d0f1ed9cb2ec4d730a173')

build() {
	cd ${srcdir}/Text-QRCode-${pkgver}

	export PERL_AUTOINSTALL="--skipdeps" PERL_MM_USE_DEFAULT="1"

	perl Makefile.PL INSTALLDIRS="vendor"
	sed -i '/^LD/s/,--as-needed//' Makefile
	make
}

check() {
	cd ${srcdir}/Text-QRCode-${pkgver}

	make test
}

package() {
	cd ${srcdir}/Text-QRCode-${pkgver}

	make DESTDIR="${pkgdir}" install

	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

