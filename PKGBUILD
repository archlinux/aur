# Maintainer: Treadful <mail at treadful dot dev>
_base_pkgname="doh-server"
pkgname="${_base_pkgname}-bin"
pkgver=0.9.16
pkgrel=3
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
	'7b99114a1d1b9a26b8a1a7280d9005fd8c088149ae349740bde3829ebcbc3049')
sha256sums_aarch64=(
	'e69e2d4bd160653ec4b5250e73ee461e71e6842d2d1acc0ef404d125c4d47c86')
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

