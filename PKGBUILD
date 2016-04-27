# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Steffen L. Norgren (incongruous) <steffen[at]norgren[dot]ca>

pkgname=luv-icon-theme-git
pkgver=0.3.r4.g3c53fec
pkgrel=1
pkgdesc="The spiritual successor to Flattr, a flat but complex icon theme for freedesktop environments."
arch=('any')
url="https://github.com/NitruxSA/luv-icon-theme"
license=('custom:CC BY-SA 4.0')
depends=('librsvg')
makedepends=('git')
provides=('flattr-icon-theme' 'luv-icon-theme')
conflicts=('flattr-icon-theme' 'luv-icon-theme')
source=("${pkgname}"::'git+https://github.com/NitruxSA/luv-icon-theme.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/^luv.v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/icons/Luv"
	install -dm755 "${pkgdir}/usr/share/icons/Luv Dark"
	cp -dpr --no-preserve=ownership ./Lüv/* "${pkgdir}/usr/share/icons/Luv"
	cp -dpr --no-preserve=ownership ./Lüv\ Dark/* "${pkgdir}/usr/share/icons/Luv Dark"

	install -Dm644 "./Lüv/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "./CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
	rm "${pkgdir}"/usr/share/icons/{Luv,Luv\ Dark}/LICENSE
}
