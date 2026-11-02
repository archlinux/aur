# Maintainer: xihale <xihale13@qq.com>

pkgname=finch-agent-bin
pkgver=1.7.5
pkgrel=1
pkgdesc="Finch Agent - lightweight desktop AI agent with cross-session memory, skills and mini tools (official deb repack, Linux beta)"
arch=('x86_64')
url="https://finchwork.app"
license=('LicenseRef-Proprietary')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss'
         'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support')
options=('!strip' '!debug')
source=("Finch-${pkgver}-amd64-linux.deb::https://github.com/finchtoys/finch-releases/releases/download/v${pkgver}/Finch-${pkgver}-amd64-linux.deb")
sha256sums=('1ebaf3f531e190d177d6bdda8e5af2569cfe6a6fe87264a24de341664084fcd1')

package() {
	bsdtar -xOf "${srcdir}/Finch-${pkgver}-amd64-linux.deb" data.tar.xz \
		| bsdtar -xpf - -C "${pkgdir}"

	# Electron's SUID sandbox helper: upstream ships it non-SUID (kernel user
	# namespaces); 4755 covers userns-less kernels, matching maka-nightly-bin here.
	chmod 4755 "${pkgdir}/opt/Finch/chrome-sandbox"
}
