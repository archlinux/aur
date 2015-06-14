# Maintainer: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>

pkgname=perl-sort-key
pkgver=1.33
pkgrel=1
_author="S/SA/SALVA"
_perlmod="Sort-Key"
pkgdesc="Sort::Key - the fastest way to sort anything in Perl"
arch=(any)
url=http://search.cpan.org/dist/sort-sort/
license=('GPL' 'PerlArtistic')
depends=(perl) 
provides=(
perl-sort-key-maker
perl-sort-key-multi
perl-sort-key-natural
perl-sort-key-register
perl-sort-key-types 
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('ed6a4ccfab094c9cd164f564024e98bd21d94f4312ccac4d6246d22b34081acf')

build() {
	cd "$srcdir/Sort-Key-$pkgver"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
}
package() {
	cd "$srcdir/Sort-Key-$pkgver"
	make install DESTDIR=${pkgdir} || return 1
	# remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
