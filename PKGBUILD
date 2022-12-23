# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Integral <luckys68@126.com>
pkgname=linuxqq-new
_pkgname=tencent-qq
pkgver=2.0.3_543
pkgrel=1
pkgdesc='New Linux QQ based on Electron'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
depends=('nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v${pkgver//_/-}_x64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/50eed662/QQ-v${pkgver//_/-}_arm64.deb")
sha512sums_x86_64=('0733ac3a85f4b14e2d1163439e0fe0bf41993339fb40ae32ba65c0c754f5c24b0709d9bdbbdfb97cfbef9ef210a96a66e27617be07d44c623880b0a4fce8e7eb')
sha512sums_aarch64=('7d949fc87b6f360a206e3da5277cd91f5c61c0df89158bfcaaeac8fc84af4c7c5da165d48d1537c3bc88ea8b27ccd722fa5e67de71ad76115ad09c6928bf82cf')

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

	# Icon
	install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/qq.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
	rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
	sed -i '6s!/opt/QQ/resources/app/512x512.png!qq!' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
