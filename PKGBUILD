# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=2.0.1_429
pkgrel=2
pkgdesc="Tencent QQ NT for Linux with bubblewrap wrapper"
arch=('x86_64')
url="https://im.qq.com"
license=('custom')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'bubblewrap' 'xdg-utils' 'xdg-user-dirs')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source=("https://dldir1.qq.com/qqfile/qq/QQNT/4691a571/QQ-v${pkgver//_/-}_x64.deb"
		'bubblewrapper.sh')
sha256sums=('e3aa15ff6ae089b655df3913c6020ca56726bd676995aaf29b313fbd0643ea42'
			'8ee170d9dd6bbdf88805427b5da2bfa9562e7f0cad8585a84b0e18f9b151325a')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/opt/QQ/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	ln -s "/opt/QQ/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.chromium.html"
	cp "${srcdir}/bubblewrapper.sh" "${pkgdir}/opt/QQ/start.sh"
	sed -i "s#/opt/QQ/qq#/opt/QQ/start.sh#" "${pkgdir}/usr/share/applications/qq.desktop"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/QQ/start.sh" "${pkgdir}/usr/bin/qq"
}
