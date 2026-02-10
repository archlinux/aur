# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.11.2
pkgrel=1
pkgdesc='An app for Mbin/Lemmy/PieFed, connecting you to the fediverse.'
arch=(x86_64 aarch64)
url=https://github.com/interstellar-app/interstellar
license=(AGPL-3.0-only)
depends=(gtk3 xdg-user-dirs mpv)
provides=(interstellar)
conflicts=(interstellar)
options=(!debug)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-aarch64.tar.gz")
sha256sums_x86_64=('bbf75b0dcc2c3313c25403ba82065331a0f60641f2b1b64c47b07acfc5519910')
sha256sums_aarch64=('53a6d4231d4bd135b0e21b418fd94e42d7effbe9d88b06cedbf060746aa3d15c')

prepare() {
	# Remove unneeded .tar.gz file from source directory (it has already been extracted).
	rm "${srcdir}"/"${pkgname}"-"${pkgver}"-*.tar.gz
}

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
