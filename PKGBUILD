# Maintainer: xifan <xifan2333@gmail.com>
# NOTE: This is an unofficial, community-maintained package.
# 注意：这是一个非官方维护的社区版本。

pkgname=roxybrowser-bin
_pkgname=roxybrowser
pkgver=3.7.3
pkgrel=1
pkgdesc="Premier Antidetect Browser - Streamline Your Workflow Effortlessly (Unofficial Community Package)"
arch=('x86_64')
url="https://roxybrowser.com"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("roxybrowser-3.7.3.deb::https://dl.roxybrowser.com/app-download/Linux-64-latest")
sha256sums_x86_64=('f70e1f20580613b884f00b6c3e456a1bf9874a279157b6c291434d9271d00aae')

package() {
	# Extract the official deb package downloaded from roxybrowser.com
	# 解压从官网下载的原版 deb 包，不做任何二次修改或重打包
	bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb"
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

	# Set required SUID permission for chrome-sandbox (standard security requirement for Chromium-based browsers)
	# 为 chrome-sandbox 设置必要的 SUID 权限（Chromium 系浏览器的标准安全要求）
	chmod 4755 "${pkgdir}/opt/RoxyBrowser/chrome-sandbox"
}
