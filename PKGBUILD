# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: AUR Perl <aurperl@juster.info>

_perlmod=File-ShareDir-Install
_modnamespace=File
pkgname=perl-file-sharedir-install
pkgver=0.10
pkgrel=1
pkgdesc="File::ShareDir::Install - Install read-only data files from a distribution"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('96c3a94da78e51c97223f16892c6bdb6a93f9602643aca6ee73fd661aefb0a018938f03b8265f255dc3daba467e01a2d2a924f33a5e1e4d2e9c9fe2698a3d09f')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
