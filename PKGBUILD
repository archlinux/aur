# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman-bin-wayland
pkgver=10.11.1
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
provides=('postman')
conflicts=('postman' 'postman-bin')
arch=('x86_64' 'aarch64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
source_x86_64=(
	"postman-${pkgver}-linux-x64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
	"postman.desktop"
)
source_aarch64=(
	"postman-${pkgver}-linux-arm64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux_arm64"
	"postman.desktop"
)
depends=(libxss nss gtk3)
sha256sums_x86_64=('b120f6b650a3608a80596f6e05af134d78c1ce02e97b154a1acc3dbc0409e38f'
	'bf8e5abb016248f25d03ac593987dd128d552872c8a8195dae3a6e9ff448d0ec')
sha256sums_aarch64=('e2ef879a2b7d5db428dfd024374e0b79c2514ec82ce0ab6a8389540ce6574a22'
	'bf8e5abb016248f25d03ac593987dd128d552872c8a8195dae3a6e9ff448d0ec')

package() {
	install -dm755 "${pkgdir}/opt/"
	cp -r "Postman" "${pkgdir}/opt/postman"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
	# Desktop file
	install -D -m644 "postman.desktop" \
		"${pkgdir}/usr/share/applications/postman.desktop"
	# Icon
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	ln -s "/opt/postman/app/resources/app/assets/icon.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
