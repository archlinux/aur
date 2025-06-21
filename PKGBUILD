# Maintainer: Treadful <mail at treadful dot dev>
_base_pkgname="doh-server"
pkgname="${_base_pkgname}-bin"
pkgver=0.9.12
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
	'b6694724f01666bf49096bbb78d52186b5a3fe5364615adb66df7f96ab6b490b')
sha256sums_x86_64=(
	'3f779626a8d1f8cad4950a7bba09b793002855d9898c53e5c25b92584120ac78')
sha256sums_aarch64=(
	'cdbaef2cb7b68317b3c0fa5be54343a2f43d239ac5b6be0fd93d13079d5f1df9')
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
	install -Dm755 "doh-proxy/doh-proxy" "$pkgdir/usr/sbin/doh-proxy"
}

