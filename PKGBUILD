# CPAN Name  : Text::QRCode
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-text-qrcode
pkgver=0.04
pkgrel=5
pkgdesc='Text-QRCode for Perl'
arch=('i686' 'x86_64')
url="http://search.cpan.org/~kurihara/Text-QRCode-${pkgver}/"
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-install')
depends=('perl' 'qrencode')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/K/KU/KURIHARA/Text-QRCode-${pkgver}.tar.gz")
sha256sums=('a38e28c739b2fc5b14440c8ce4bff4309d8d639f71651bbee0b903ee4a13443c')

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

