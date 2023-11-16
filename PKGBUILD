# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=focalboard-bin
pkgver=v7.11.3
pkgrel=2
epoch=
pkgdesc="A self-hosted alternative to Trello, Notion, and Asana."
arch=(x86_64)
url="https://github.com/mattermost/focalboard"
license=('MIT')
groups=()
depends=(webkit2gtk)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/mattermost/focalboard/releases/download/${pkgver}/focalboard-linux.tar.gz"
	"focalboard.desktop"
	"focalboard_launcher.sh"
)
noextract=()
sha256sums=('27c6f2af28c67deb97064ba6702ba868281fd810e75ad16d8b62f9a4504b87a0'
            'add7476a4f14b0ba62c1123d51d01553e2ff7f10c0953c3ccc9d05c22c1a2e25'
            '2a76b99b190bdaf347eef3c4b92e63a2164204455094653a9231a535881cd18b')
validpgpkeys=()

package() {
	cd focalboard-app
	mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	# Copy data in /usr/share
	cp -r focalboard-app pack config.json "${pkgdir}/opt/${pkgname}/"

	# Create .desktop entry
	install "${srcdir}/focalboard.desktop" "${pkgdir}/usr/share/applications/"

	# Copy favicon into folder
	install "${srcdir}/focalboard-app/pack/static/favicon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/focalboard.svg"

	# Create launcher in /usr/bin
	install "${srcdir}/focalboard_launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
}
