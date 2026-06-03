# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.11.4
pkgrel=1
pkgdesc='An app for Mbin/Lemmy/PieFed, connecting you to the fediverse.'
arch=(x86_64 aarch64)
url=https://github.com/interstellar-app/interstellar
license=(AGPL-3.0-only)
depends=(gtk3 xdg-user-dirs mpv)
optdepends=('kunifiedpush: push notification support')
provides=(interstellar)
conflicts=(interstellar)
options=(!debug)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/interstellar-linux-aarch64.tar.gz")
sha256sums_x86_64=('7f5ad995e2b4bf71928db1d841f3322160effd5b08994b9de60b6417a4158689')
sha256sums_aarch64=('efa3718aab8eb30da3276c1832154279683ed501a41390b2229760d642aff229')

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
