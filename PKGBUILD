# Maintainer: Nafis <mnabid.25@outlook.com>

pkgname=irccloud-bin
_pkgname=${pkgname%-bin}
pkgver=0.16.0
pkgrel=1
pkgdesc="Chat on IRC from anywhere, and never miss a message"
arch=('x86_64')
url="https://www.irccloud.com/"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'xdg-utils' 'at-spi2-core' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/irccloud/irccloud-desktop/releases/download/v${pkgver}/${_pkgname}-desktop_${pkgver}_linux_amd64.deb")
md5sums=('acd8af9504144161a08e687ebd609605')

package() {
	tar xf data.tar.xz -C ${pkgdir}

	# Link to the binary
	mkdir ${pkgdir}/usr/bin
	ln -sfv /opt/IRCCloud/irccloud ${pkgdir}/usr/bin/irccloud

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 ${pkgdir}/opt/IRCCloud/chrome-sandbox
}
