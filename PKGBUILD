# Maintainer : David Phillips < dbphillipsnz , gmail >
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-poe-component-irc
pkgver=6.88
pkgrel=2
pkgdesc="A fully event-driven IRC client module"
depends=('perl>=5.10.0' 'glibc' 'perl-poe' 'perl-poe-filter-ircd' 'perl-poe-component-pluggable' 'perl-poe-component-client-dns' 'perl-irc-utils')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/POE-Component-IRC"
source=(http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Component-IRC-${pkgver}.tar.gz)
sha256sums=('5d7f2168383c93e54b00d06695cc52f514a921e1ee4f45a05950700f50075a8f')
options=('!emptydirs')
arch=('i686' 'x86_64')

build()
{
	cd "${srcdir}/POE-Component-IRC-${pkgver}"

	perl Makefile.PL INSTALLDIRS=vendor
	make
}

package()
{
	cd "${srcdir}/POE-Component-IRC-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Remove .packlist and perllocal.pod files.
	find "${pkgdir}" -name '.packlist' -delete
	find "${pkgdir}" -name 'perllocal.pod' -delete
}
