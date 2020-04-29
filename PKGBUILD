# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=hydroxide
pkgver=0.2.14
pkgrel=3
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
url='https://github.com/emersion/hydroxide'
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=("21f07c88e3e33319672d60e1ba062dd18f2e04767a7c70616007098743f8d6e2f53e325f688c910f53d34823257a0e9c60057a1ac899757c37877f36352cdb16"
            "SKIP")
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-ldflags "-extldflags ${LDFLAGS}" \
		"./cmd/${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -- "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
