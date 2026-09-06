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
sha256sums=('ee7ce640098a0d75721ed9b281bf30e7ec9f44f9d056f4f9edfcf8c2585cf8d7')

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
