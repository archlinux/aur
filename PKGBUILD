# Maintainer: Treadful <mail at treadful dot dev>
_base_pkgname="doh-server"
pkgname="${_base_pkgname}-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast, mature, secure DoH and ODoH server proxy written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/DNSCrypt/doh-server"
license=('MIT')
depends=()
provides=("${_base_pkgname}=${pkgver}")
conflicts=("${_base_pkgname}=${pkgver}")
backup=(
	"usr/lib/systemd/system/${_base_pkgname}.service"
)
source=(
	"${_base_pkgname}.sysusers"
	"${_base_pkgname}.service")
source_x86_64=(
	"${pkgname}-${pkgver}.tar.bz2::https://github.com/DNSCrypt/doh-server/releases/download/${pkgver}/doh-proxy_${pkgver}_linux-x86_64.tar.bz2")
source_aarch64=(
	"${pkgname}-${pkgver}.tar.bz2::https://github.com/DNSCrypt/doh-server/releases/download/${pkgver}/doh-proxy_${pkgver}_linux-aarch64.tar.bz2")
noextract=()
sha256sums=(
	'56ffc1c5331aa6b372c84d345f6a352d5321ab2787eea92449b6c3776b9c4711'
	'57b1cb9011c96531d6a93253c23ab114af5ff3b5c447f9a3029983744676bf97')
sha256sums_x86_64=(
	'98a8e2a3fa9ad4ffccded1ef6e1d0b2a6647755edea76ed3394cc7b27ea34829')
sha256sums_aarch64=(
	'f588e5bafcd4b36e490466bbbb693eae6e1d783c68dbb5314a1523bd1a27f114')
validpgpkeys=()

package() {
	# Systemd files
	install -dm755 \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${_base_pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${_base_pkgname}.conf"
	install -Dm644 "${srcdir}/${_base_pkgname}.service" \
		"$pkgdir/usr/lib/systemd/system/${_base_pkgname}.service"

	# bin
	install -Dm755 "doh-proxy/doh-proxy" "$pkgdir/usr/bin/doh-proxy"
}

