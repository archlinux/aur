# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.10.1
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
sha256sums_x86_64=('1aaa1ae290a75db1d8d9c5d5f6e2378873f19272e1263166845f07e7601153d7')
sha256sums_aarch64=('e4c9b9224f0aa88f0fe25a201cecb7f31a2a6cac29eb65f363053d53292b509a')

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
