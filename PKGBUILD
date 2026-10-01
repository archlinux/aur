# Maintainer: Izuna <izuna.seikatsu AT ccbluex DOT net>
# Submitter: XSilverTH <XSilverTH AT proton DOT me>

# I keep forgetting the command to generate the .SRCINFO file, so I put it here as a reminder.
# makepkg --printsrcinfo > .SRCINFO

pkgname=liquidlauncher-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A custom Minecraft launcher for LiquidBounce"
arch=('x86_64' 'aarch64')
url="https://liquidbounce.net"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk4' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/CCBlueX/LiquidLauncher/releases/download/v${pkgver}/liquidlauncher_${pkgver}_arm64.deb")
sha512sums_x86_64=('a89c74a65ec8c558ff976c39810ca2ef33af16a3c24dee69475f845b9b2b945681c66e7185a5163d8019121ef57732c5a132d91035926a10fd3ed4f14862a327')
sha512sums_aarch64=('0a491952232cecfbb435c88617136f16fdd42c5550a4358fd25e7ed51d260a27c6e2665d8232d5a1fe71cf3713c45ce14c6537fa2f8640d8de1494250d067c13')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# pacman owns updates, keep the launcher from running dpkg on itself
	install -dm755 "${pkgdir}/usr/lib/liquidlauncher"
	mv "${pkgdir}/usr/bin/liquidlauncher" "${pkgdir}/usr/lib/liquidlauncher/"
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/liquidlauncher" <<-'EOF'
	#!/bin/sh
	LIQUIDLAUNCHER_SKIP_UPDATE=1 exec /usr/lib/liquidlauncher/liquidlauncher "$@"
	EOF
}
