# Maintainer: titangold <titangold at joec dot de>
pkgname="mqtt-explorer-bin"

pkgdesc="A comprehensive and easy-to-use MQTT Client"

pkgver=0.4.0_beta.6
pkgrel=1

arch=(x86_64)

url="https://github.com/thomasnordquist/MQTT-Explorer"
license=("CC-BY-ND-4.0")

depends=(nspr libxcomposite gtk3 expat alsa-lib cairo libx11 at-spi2-core gcc-libs nss libxkbcommon libxdamage libxext hicolor-icon-theme libcups mesa glibc libxcb glib2 libxrandr dbus libdrm pango libxfixes)

provides=(mqtt-explorer)
conflicts=(mqtt-explorer mqtt-explorer-beta)

source=("https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v${pkgver//_/-}/MQTT-Explorer_${pkgver//_/-}_amd64.deb"
        "mqtt-explorer.desktop")
md5sums=("75521ffee7c8f243a1ea95fcb5a4fad3"
         "fb5c804b20b420b0966bf95647df4f45")

package() {
	# extract the files from the Debian package
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	# make the directory for the symlink
	mkdir -p "${pkgdir}/usr/bin"

	# make a symlink to the executable
	ln -s "/opt/MQTT Explorer/mqtt-explorer" "${pkgdir}/usr/bin/mqtt-explorer"

	# make a symlink to the desktop entry
# 	mkdir -p "${pkgdir}/usr/share/pixmaps
        install -Dm 644 mqtt-explorer.desktop -t "$pkgdir"/usr/share/applications

}

