# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=perl-geo-distance
pkgver=0.25
pkgrel=1
pkgdesc='Geo::Distance - Perl interface to calculate geo distance from latitude and longitude'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Geo-Distance'
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-module-build-tiny')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLUEFEET/Geo-Distance-${pkgver}.tar.gz")
sha256sums=('2c673dd57c86208370da100f75f0482531b05306aa5f72107b0eae90b6ceb615')

build() {
	cd "${srcdir}/Geo-Distance-${pkgver}"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Build.PL
	./Build
}

package() {
	cd "${srcdir}/Geo-Distance-${pkgver}"

	./Build install --installdirs=vendor --destdir="$pkgdir"

	# remove perllocal.pod and .packlist
	find "${pkgdir}" -name perllocal.pod -delete
	find "${pkgdir}" -name .packlist -delete
}

