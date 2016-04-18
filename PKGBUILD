# Maintainer: 3ED <krzysztof1987 at gmail>

pkgbase=perl-checkupdates-aur
pkgname=(perl-checkupdates-aur checkupdates-aur)
_pkgname=CheckUpdates-AUR
pkgver=0.03
pkgrel=1
pkgdesc="checkupdates for aur"
arch=('any')
url="https://github.com/3ed/CheckUpdates-AUR"
license=('Artistic2.0')
depends=('perl-www-aur' 'perl-json' 'perl-try-tiny')
makedepends=('perl-module-build')
optdepends=('perl-smart-comments: for debug perpose only')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/3ed/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7c7b4b67a5203b7a1f5839cb4945fbe5e210ba4ffa6d9f4f73e89bf1366c04b1')

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
