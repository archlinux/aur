# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Integral <integral@member.fsf.org>

_pkgname=linuxqq
pkgname=linuxqq-nt
install=linuxqq-nt.install
pkgver=3.2.28_260429
pkgrel=2
epoch=5
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64' 'loong64')
url="https://im.qq.com/${_pkgname}"
license=('LicenseRef-QQ')
conflicts=('linuxqq-nt-bwrap' 'linuxqq')
provides=("linuxqq")
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source_x86_64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_amd64_01.deb')
source_aarch64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_arm64_01.deb')
source_loong64=('https://dldir1v6.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.28_260429_loongarch64_01.deb')
source=("${_pkgname}.sh")
sha512sums=('240c3ada9f96e80d4c8f927279d4457c43956a07f381bf712bff321651e90e6d856c69af2a6c6d2a86c63769fdf8d37857f82da4de95d13cbd8045b6850daa87')
sha512sums_x86_64=('0f91db286b25915adfd57dbd66365f11f4e8d0614a5ce4eef659ee757e3c6464cefa8b290a1f74fa3c875e8c03d94a8fa873e88fe3b1b26c59e02fec5a8daeab')
sha512sums_aarch64=('5b5e776ea60bba750bb6ef6426e7089d54719056ab9acec85415c28238123caf23074a3e57e8354a64af75fb58ed4c3be56b6f1d3fef84bc0268489466dbc7b2')
sha512sums_loong64=('e0a3ac489b6ac681184df23f3127a34bf776b92a0ffa4739213a754fbf66c32893a1799d823c6e7f57743d895a9056a5ffb85bac5ee5b528a9af3d71b1755a64')
options=('!strip' '!debug')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}/"

	# Launcher
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop entry fixes
	sed -i 's|Exec=/opt/QQ/qq|Exec=linuxqq|' "${pkgdir}/usr/share/applications/qq.desktop"
	sed -i 's|Icon=/usr/share/icons/hicolor/512x512/apps/qq.png|Icon=qq|' "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# SUID sandbox
	chmod 4755 "${pkgdir}/opt/QQ/chrome-sandbox"
}
