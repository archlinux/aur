# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='An app for Mbin/Lemmy/PieFed, connecting you to the fediverse.'
arch=(x86_64 aarch64)
url=https://github.com/jwr1/interstellar
license=(AGPL-3.0-only)
depends=(gtk3 xdg-user-dirs mpv)
provides=(interstellar)
conflicts=(interstellar)
options=(!debug)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-aarch64.tar.gz")
sha256sums_x86_64=('29f6f56c5e78c02c1bde28d1b8280eb831c534801ad55c8a67a563a3d0adaab8')
sha256sums_aarch64=('3f08b58d9384dd856f9bb4857a8bcefd0dd0da732ea4ba9cb41e9f223e9111dd')

package() {
	# Setup directories
	install -dm755 "${pkgdir}/usr/share/interstellar"
	install -dm755 "${pkgdir}/usr/bin"

	# Copy .desktop and icon
	install -Dm644 "${startdir}/interstellar.desktop" "${pkgdir}/usr/share/applications/interstellar.desktop" 
	install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/interstellar.png"

	# Copy app files
	cp -r "${srcdir}/." "${pkgdir}/usr/share/interstellar/"

	# Link executable
	ln -s "/usr/share/interstellar/interstellar" "${pkgdir}/usr/bin/interstellar"
}
