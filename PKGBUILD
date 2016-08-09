# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Steffen L. Norgren (incongruous) <steffen[at]norgren[dot]ca>

pkgname=luv-icon-theme-git
pkgver=0.4.r82.g961ba1f
pkgrel=1
pkgdesc="The spiritual successor to Flattr, a flat but complex icon theme for freedesktop environments."
arch=('any')
url="https://github.com/NitruxSA/luv-icon-theme"
license=('custom:CC BY-SA 4.0')
depends=('librsvg')
makedepends=('git')
provides=("flattr-icon-theme=${pkgver}" "luv-icon-theme=${pkgver}")
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

	install -dm755 "${pkgdir}/usr/share/icons/Lüv"
	install -dm755 "${pkgdir}/usr/share/icons/Lüv Dark"
	cp -dpr --no-preserve=ownership ./Lüv/* "${pkgdir}/usr/share/icons/Lüv"
	cp -dpr --no-preserve=ownership ./Lüv\ Dark/* "${pkgdir}/usr/share/icons/Lüv Dark"

	install -Dm644 "./Lüv/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "./CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
	rm "${pkgdir}"/usr/share/icons/{Lüv,Lüv\ Dark}/LICENSE
}
