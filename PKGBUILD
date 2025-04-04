# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
pkgname=gtfs-to-html
pkgver=2.10.10
pkgrel=1
pkgdesc="Build human readable transit timetables as HTML or PDF from GTFS."
arch=('x86_64' 'aarch64')
url="https://gtfstohtml.com/"
license=('MIT')
groups=()
depends=(
	bash
	gcc-libs
	glibc
	nodejs
)
makedepends=('npm')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('4c8daca90b6083034f93568ec5cbc4931245670eeb83b086c57860d28897f40ab526586a14813b26157e12843f50007892258851738e3fba0ddbdd3189bb65f0')

prepare() {
	npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}

package() {
	npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz" --offline
	install -Dm644 package/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm644 package/config-sample.json "${pkgdir}/usr/share/doc/${pkgname}/config-sample.json"
	chown -R root:root "$pkgdir"
}
