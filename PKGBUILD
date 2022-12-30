# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Integral <luckys68@126.com>
pkgname=linuxqq-new
_pkgname=tencent-qq
pkgver=3.0.0_565
pkgrel=1
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/64bd2578/linuxqq_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/64bd2578/linuxqq_${pkgver//_/-}_arm64.deb")
sha512sums_x86_64=('f100636ac9e2dfe144e3fe908277b5290d4e0963eadd66bece56caaf27f483ac1abcf488bfbbc56e06490998fb635711918ae34de1334ae7d557741c5a20e797')
sha512sums_aarch64=('bddf7fa38d70b8fce9d0827b748655d096176d8f0036ca37733f5ac6a09f02630f0c5c90b8096b8f796d057135eebc2664eea9e61a41d88d738b8199b26dab8f')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."
	# Launcher
	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/QQ/qq" "${pkgdir}/usr/bin/${_pkgname}"

	# Launcher Fix
	sed -i '3s!/opt/QQ/qq!/usr/bin/tencent-qq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
