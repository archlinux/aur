# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Steffen L. Norgren (incongruous) <steffen[at]norgren[dot]ca>

pkgname=luv-icon-theme-git
epoch=1
pkgver=r836.f236f33
pkgrel=1
pkgdesc="The spiritual successor to Flattr, a flat but complex icon theme for freedesktop environments."
arch=('any')
url="https://github.com/Nitrux/luv-icon-theme"
license=('custom:CC BY-SA 4.0')
depends=('librsvg')
makedepends=('git')
provides=("flattr-icon-theme=${pkgver}" "luv-icon-theme=${pkgver}")
conflicts=('flattr-icon-theme' 'luv-icon-theme')
source=("${pkgname}"::'git+https://github.com/Nitrux/luv-icon-theme.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	(
	set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/icons"
	cp -dpr --no-preserve=ownership ./Luv "${pkgdir}/usr/share/icons/"

	install -Dm644 "./Luv/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "./CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
	rm "${pkgdir}/usr/share/icons/Luv/LICENSE"
}
