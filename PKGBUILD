# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mtop
pkgver=0.6.6
pkgrel=4
pkgdesc='MySQL top (monitor and examine slow queries)'
arch=('i686' 'x86_64')
url='"http://mtop.sourceforge.net/'
license=('GPL')
depends=('perl-dbd-mysql' 'perl-curses')
backup=('etc/mtoprc')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	'mtoprc')
sha256sums=('2e7fc09511d2d0f130da1f52bf85fcfeea0be2cc3aa3d93b88498605c0281d74'
	'88709b23b3edfb5ec52a88af76cfad422c1fd0f6d9c773b8c9a2516de2b2ecc5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL --prefix=/usr

	make
}

check() (
	cd "${srcdir}/${pkgname}-${pkgver}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1

	make test
)


package() {
	cd ${srcdir}/${pkgname}-${pkgver}


	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS="vendor" DESTDIR="${pkgdir}"

	install -D -m0755 "${srcdir}/mtoprc" "${pkgdir}/etc/mtoprc"
}

