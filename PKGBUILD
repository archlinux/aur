# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='renrot'
pkgver='1.2.0'
pkgrel='2'
pkgdesc='Rename and losslessly rotate files according to their EXIF tags values'
arch=('any')
url="https://puszcza.gnu.org.ua/projects/$pkgname"
license=('Artistic-2.0')
depends=('perl' 'perl-image-exiftool' 'libjpeg-turbo')
optdepends=('imagemagick: contact sheet generation')
options=('!emptydirs')
source=(
	"$pkgname-$pkgver.tar.gz::https://download.gnu.org.ua/pub/release/$pkgname/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.sig::https://download.gnu.org.ua/pub/release/$pkgname/$pkgname-$pkgver.tar.gz.sig"
)
sha512sums=('3eb136abcbb29a64a07c4a6496c691efdd2dac1c5ed1cdcee195a58c0640cb43d12874b95bb94f8fc57208cf2c0f2b22bad28e648f7e29875a87efe64aa35c11'
            'SKIP')
validpgpkeys=('086CC0E1117005794DCCA30C46F40A4615E2BEDC') # Zeus Panchenko <zeus.panchenko@gmail.com> (https://puszcza.gnu.org.ua/users/zeus)

_sourcedirectory="$pkgname-$pkgver"

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
