# Maintainer: Shira
# Contributor: Shira
pkgname=seerrng-deb
pkgver=3.13.2
pkgrel=1
pkgdesc="Seerr fork with music, books and audiobooks support. Installed from .deb"
arch=('x86_64')
url="https://github.com/snapetech/seerrng"
license=('MIT')
depends=('nodejs>=22')
provides=('seerrng' 'seerr')
conflicts=('seerrng' 'seerrng-git' 'seerrng-bin')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/seerrng_${pkgver}_amd64.deb")
sha256sums=('265502308da859032051ec698f331f93c06cf7de4dbb74e827a65a6a718c0b18')

package(){

	# Extract package data
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	install -dm755 "${pkgdir}/etc/seerrng"

	install -Dm644 "usr/lib/seerrng/node_modules/.pnpm/zwitch@2.0.4/node_modules/zwitch/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "usr/share/doc/seerrng/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
