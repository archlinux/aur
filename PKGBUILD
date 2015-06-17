# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname='perl-thread-pool-simple'
_cpanname='Thread-Pool-Simple'
pkgver='0.25'
pkgrel='3'
pkgdesc="A simple thread-pool implementation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8')
url="http://search.cpan.org/dist/${_cpanname}"
source=("http://search.cpan.org/CPAN/authors/id/J/JW/JWU/${_cpanname}/${_cpanname}-${pkgver}.tar.gz")
md5sums=('ac144e153813174c0d6b22425d1a24d1')
sha512sums=('8cc89c42f5d2b4210a21f9cfc977ea0938d4405bab95d01015d38f189d958421bddc4bb734640accfa3f7e4ac21fd04119f078a684e1a8b1d910cd3cab8c7452')

build() {
	( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null

		cd "${srcdir}/${_cpanname}-${pkgver}"
		/usr/bin/perl Makefile.PL
		make
	)
}

check() {
	cd "${srcdir}/${_cpanname}-${pkgver}"
	( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
		make test
	)
}

package() {
	cd "${srcdir}/${_cpanname}-${pkgver}"
	make install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
