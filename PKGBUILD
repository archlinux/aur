# Maintainer: 3ED <krzysztof1987 at gmail>

pkgbase=perl-checkupdates-aur
pkgname=(perl-checkupdates-aur checkupdates-aur)
_lastauthor=T/TH/THREEED
_pkgname=OS-CheckUpdates-AUR
pkgver=0.04
pkgrel=1
pkgdesc="checkupdates for aur"
arch=('any')
url="https://metacpan.org/release/${_pkgname}"
license=('Artistic2.0')
depends=('perl-www-aur' 'perl-json' 'perl-try-tiny')
makedepends=('perl-module-build')
optdepends=('perl-smart-comments: for debug perpose only')
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4e107c9953ff52597098fff5bf0eee4aa6dad223ada3a7e60670c8cf5695eb2a')

build() {
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

	cd "${_pkgname}-${pkgver}"
	perl Build.PL
	perl Build
}

check() {
	cd "${_pkgname}-${pkgver}"
	perl Build test
}

package_perl-checkupdates-aur() {
	cd "${_pkgname}-${pkgver}"
	perl Build install

	rm -rf "$pkgdir/usr/bin/"
}

package_checkupdates-aur() {
	depends=('perl-checkupdates-aur')

	cd "${_pkgname}-${pkgver}"
	install -D -m755 bin/checkupdates-aur "$pkgdir/usr/bin/checkupdates-aur"
}
