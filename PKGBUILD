# Maintainer: Léo Haf <leo@haf.ovh>
pkgname=datum-gateway
pkgver=0.4.0beta
pkgrel=1
pkgdesc="Decentralized Alternative Templates for Universal Mining"
arch=(x86_64)
url="https://ocean.xyz"
license=('LicenseRef-MIT-OCEAN')
groups=(bitcoin)
depends=('libmicrohttpd' 'libsodium' 'curl' 'jansson' 'glibc')
makedepends=('cmake' 'git')
backup=('etc/datum-gateway/config.json')
source=("datum-gateway::git+https://github.com/OCEAN-xyz/datum_gateway.git#tag=v0.4.0beta?signed")
sha256sums=('eed645c674089f9f26255d01910e74299bae1482488d486b3e9d07f3e7b13215')
validpgpkeys=(
	"1A3E761F19D2CC7785C5502EA291A2C45D0C504A" # Luke Dashjr <luke@dashjr.org>
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
