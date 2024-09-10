# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
pkgname=gtfs-to-html
pkgver=2.9.6
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
b2sums=('2b6dd8d47f043cb525e55dbbc0ca39e7062e763e7b5a61f29d644dfd3b9ea78eaa7810e37f0da1b52f32b8bd11d6c734e6669f4fadfdbc99adf2e76a71e1f80d')

prepare() {
	npm pack $pkgname
}

package() {
	npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
	install -Dm644 package/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm644 package/config-sample.json "${pkgdir}/usr/share/doc/${pkgname}/config-sample.json"
	chown -R root:root "$pkgdir"
}
