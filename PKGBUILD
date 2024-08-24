# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
pkgname=gtfs-to-html
pkgver=2.7.2
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
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('12cf5f0887e7b80d0b81b84a5f162c94964ddb87219d564b52c93e22d5bb12bd')

prepare() {
	npm pack $pkgname
}

package() {
	npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
	install -Dm644 package/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm644 package/config-sample.json "${pkgdir}/usr/share/doc/${pkgname}/config-sample.json"
	chown -R root:root "$pkgdir"
}
