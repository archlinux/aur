# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='renrot'
pkgver='1.2.0'
_commit='5fc8c005c2010d081fb50a96395cf1afc65a6cdb'
pkgrel='1'
pkgdesc='Rename and losslessly rotate files according to their EXIF tags values'
arch=('any')
url="https://puszcza.gnu.org.ua/projects/$pkgname"
license=('PerlArtistic')
depends=('perl' 'perl-image-exiftool' 'libjpeg-turbo')
optdepends=(
	'imagemagick: contact sheet generation'
)
options=('!emptydirs' 'purge')
source=("https://git.gnu.org.ua/$pkgname.git/snapshot/$pkgname-$_commit.tar.gz")
sha512sums=('f317e641ead6ab12af53ac0cd73aa5d80e3c8b51d7b7bb2f5fa2df3602091e0fdb8a50fec63b2e5eaf11a865477f6263ef6a9e0e1fc70071bed752aef6f9c1e4')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

    /usr/bin/perl Makefile.PL
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
