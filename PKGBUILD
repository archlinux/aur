# Maintainer: BasedUser <route@baseduser.eu.org>
# Co-maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=orbitfight
pkgver=0.8.1
pkgrel=2
pkgdesc="A game in C++ written with SFML, very in-development"
arch=('x86_64')
url="https://github.com/Ilya246/${pkgname}"
license=('GPL3')
depends=('ttf-hack')
makedepends=('sfml' 'gendesk')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	gendesk -f --pkgname "${pkgname}" --pkgdesc "${pkgdesc}"
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/lib/${pkgname}/"
	install -d "${pkgdir}/usr/lib/${pkgname}/assets"
	ln -s "/usr/share/fonts/TTF/Hack-Regular.ttf" "${pkgdir}/usr/lib/${pkgname}/assets/font.ttf"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"

	install -Dm644 'SERVERS.md' -t "${pkgdir}/usr/share/${pkgname}/"

	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
