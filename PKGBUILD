# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='An app for Mbin/Lemmy/PieFed, connecting you to the fediverse.'
arch=(x86_64 aarch64)
url=https://github.com/jwr1/interstellar
license=(GPL-3.0-only)
depends=(gtk3 xdg-user-dirs mpv)
provides=(interstellar)
conflicts=(interstellar)
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/interstellar-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/interstellar-linux-aarch64.tar.gz")
sha256sums_x86_64=('b73cc629ae986593cab429ea608df026a684513f9d67c6a970cdd8f73aab9f2c')
sha256sums_aarch64=('f96334d00b9de6913dbbb134863dbfbe3e6888124e676acbd624b8114fe47202')

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
