# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
_pkgname=linuxqq
pkgname=linuxqq-nt-bwrap
pkgver=2.0.1_b1
pkgrel=2
pkgdesc="Tencent QQ NT for Linux with bubblewrap wrapper"
arch=('x86_64' 'aarch64')
url="https://im.qq.com"
license=('custom')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'bubblewrap' 'xdg-utils' 'xdg-user-dirs')
optdepends=('libappindicator-gtk3')
provides=('linuxqq' 'linuxqq-nt' 'linuxqq-new')
conflicts=('linuxqq' 'linuxqq-new' 'linuxqq-electron')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/4691a571/QQ-v2.0.1-429_x64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/0186a650/QQ-v2.0.1-453_arm64.deb")
source=('start.sh')
sha256sums_x86_64=('e3aa15ff6ae089b655df3913c6020ca56726bd676995aaf29b313fbd0643ea42')
sha256sums_aarch64=('70c286006dae10da06c191b5f0718d17d686a8ef792f6f72215734773f01498b')
sha256sums=('4125f66a4ba979fae2a4d0c91e7f61f985f41e0f65a05b92d8c17326fa2c3d91')

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
