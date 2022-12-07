# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=2.0.1_429
pkgrel=3
pkgdesc="Tencent QQ NT for Linux with bubblewrap wrapper"
arch=('x86_64')
url="https://im.qq.com"
license=('custom')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'bubblewrap' 'xdg-utils' 'xdg-user-dirs')
optdepends=('libappindicator-gtk3')
provides=('linuxqq' 'linuxqq-nt' 'linuxqq-new')
conflicts=('linuxqq' 'linuxqq-new' 'linuxqq-electron')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source=("https://dldir1.qq.com/qqfile/qq/QQNT/4691a571/QQ-v${pkgver//_/-}_x64.deb"
		'start.sh')
sha256sums=('e3aa15ff6ae089b655df3913c6020ca56726bd676995aaf29b313fbd0643ea42'
			'5a6b2378ff764e347e17e1587ba588ae06cf4fc3081c2a2f4ee129872d8f4211')

package(){
	tar -xJ -f "data.tar.xz" -C "${pkgdir}"
	mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/512x512"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.chromium.html"
	cp "${srcdir}/start.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s#/opt/QQ/qq#/opt/QQ/start.sh#" "${pkgdir}/usr/share/applications/qq.desktop"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
