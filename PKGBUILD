# Maintainer: isbest <icoderdev@outlook.com>

pkgname=mirasim-bin
pkgver=0.0.354
pkgrel=1
pkgdesc='Terminal, agent, model and tool orchestrator'
arch=('x86_64' 'aarch64')
url='https://mirasim.ai'
license=('LicenseRef-proprietary')
depends=(
	alsa-lib
	at-spi2-core
	cairo
	dbus
	expat
	glib2
	gtk3
	hicolor-icon-theme
	libcups
	libdrm
	libnotify
	libsecret
	libx11
	libxcb
	libxcomposite
	libxdamage
	libxext
	libxfixes
	libxkbcommon
	libxrandr
	libxss
	libxtst
	mesa
	nspr
	nss
	pango
	systemd-libs
	util-linux-libs
	xdg-utils
)
optdepends=('libappindicator: system tray icon')
provides=("mirasim=${pkgver}")
conflicts=('mirasim')
options=('!strip' '!debug')
source_x86_64=("https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-amd64.deb")
source_aarch64=("https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('225335cce738b292ef6ff06aa82410937cd77b068c927dfb14d80c04bcc20dd1')
sha256sums_aarch64=('4e1f20ba8c8549d997d08f05276cc3ed325cae656d49522c8e75ded19bbc1031')

package() {
	local deb
	case "$CARCH" in
		x86_64) deb="${srcdir}/Mirasim-${pkgver}-linux-amd64.deb" ;;
		aarch64) deb="${srcdir}/Mirasim-${pkgver}-linux-arm64.deb" ;;
	esac

	# Upstream links this command in the deb postinst. The desktop file execs
	# the absolute path under /opt, so the app does not depend on the link.
	bsdtar -xOf "$deb" data.tar.xz | bsdtar -x -C "$pkgdir" -f -
	install -dm755 "${pkgdir}/usr/bin"
	ln -s /opt/Mirasim/mirasim-desktop "${pkgdir}/usr/bin/mirasim-desktop"
}
