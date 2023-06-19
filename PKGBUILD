# Maintainer: Francis Agyapong <francisagyapong2 at gmail dot com>

_pkgname="nats-server"
pkgname="${_pkgname}-bin"
pkgdesc="Simple, secure and high performance open source messaging system"
pkgver=2.9.18
pkgrel=1
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
arch=("x86_64")
url="https://nats.io"
license=("Apache")
source=(
	"https://github.com/nats-io/nats-server/releases/download/v$pkgver/nats-server-v$pkgver-linux-amd64.zip"
	"local://nats-server.service"
)

sha256sums=(
	"50bbe7abb54e1fa78cffb8e02760aae6e4ebbd049033e5a96d56111ad262f557"
	"3dcf497f31d8502712773d63801e6aa33416851fcf5e58a504a72c7d105960ce"
)

package() {
	local actual_srcdir="$srcdir/$_pkgname-v$pkgver-linux-amd64"

	install -Dm 755 "${actual_srcdir}/nats-server" -t "${pkgdir}/usr/bin"
	install -Dm 644 "${srcdir}/nats-server.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${actual_srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
