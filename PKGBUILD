# Maintainer: Léo Haf <leo@haf.ovh>
pkgname=datum-gateway
pkgver=0.5.1beta
pkgrel=1
pkgdesc="Decentralized Alternative Templates for Universal Mining"
arch=(x86_64)
url="https://ocean.xyz"
license=('LicenseRef-MIT-OCEAN')
groups=(bitcoin)
depends=('libmicrohttpd' 'libsodium' 'curl' 'jansson' 'glibc')
makedepends=('cmake' 'git')
backup=('etc/datum-gateway/config.json')
source=("datum-gateway::git+https://github.com/OCEAN-xyz/datum_gateway.git#tag=v0.5.1beta?signed")
sha256sums=('055e6bb58b303f58b9b06020dd51f688300a2e2f105f22ef1a42e29b3ef8793f')
validpgpkeys=(
	"DAED928C727D3E613EC46635F5073C4F4882FFFC" # Léo Haf <leo@haf.ovh>
)

build() {
	cd "datum-gateway"
	cmake . && make -j "$(nproc)"
}

package() {
	cd "datum-gateway"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 datum_gateway "${pkgdir}/usr/bin/"
	
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	install -dm755 "${pkgdir}/etc/${pkgname}"
	install -m644 doc/example_datum_gateway_config.json "${pkgdir}/etc/datum-gateway/config.json"
}
