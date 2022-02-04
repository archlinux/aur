# Maintainer: "Jameson Pugh <imntreal@gmail.com>"
# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>

pkgname=perl-net-sftp-foreign
pkgver=1.93
pkgrel=1
pkgdesc="Perl SFTP client using the native SSH client application"
arch=('any')
url='http://search.cpan.org/~salva/Net-SFTP-Foreign'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0') 
optdepends=('perl-file-which' 'perl-sort-key')
options=('!emptydirs')
changelog=Changes
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Net-SFTP-Foreign-${pkgver}.tar.gz")
sha256sums=('6c7d64250876873da434800e5060a8bef7a46451d81f817e37e43cfda51a0f7a')

build() {
	cd "${srcdir}/Net-SFTP-Foreign-${pkgver}"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
}

package() {
	cd "${srcdir}/Net-SFTP-Foreign-${pkgver}"
	make install DESTDIR=${pkgdir} || return 1
	# remove perllocal.pod and .packlist
	find "${pkgdir}" -name perllocal.pod -delete
	find "${pkgdir}" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
