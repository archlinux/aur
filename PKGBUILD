# Maintainer: Integral <integral@member.fsf.org>

pkgname=ydbg
pkgver=1.0.6
pkgrel=1
pkgdesc="移动办公 An office software for government & enterprise, developed by China Mobile."
arch=('x86_64' 'aarch64')
url="https://zhengqi.10086.cn/hebangong/index.html"
license=('LicenseRef-ydbg')
depends=('gtk3' 'libwebp' 'kwin' 'libbsd')
source_x86_64=("https://dlydbg.cmzq-office.com/pc/uos_${pkgver}_amd64.deb")
source_aarch64=("https://dlydbg.cmzq-office.com/pc/uos_${pkgver}_arm64.deb")
sha512sums_x86_64=('736ef40a14ec799c9857200f1f4aa5f99ab598164a42bbb75b563d3c139f068f462d92131f08618e56f36a21dbf40e62e9e07cf38d39cc2d30a76814c0f0d1b5')
sha512sums_aarch64=('7cb8948d4eab79d3e73853c6bbbc418660256f097d26ec0c5caeef7762c2d1cd772a3fea300d14b87b9841a4483cef636f0a9ede72fca0c95eebfd24e0f67285')

package() {
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"

	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/apps/com.cmic.yidongbangong/files/yidongbangong" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/com.cmic.yidongbangong/entries/applications/com.cmic.yidongbangong.desktop" \
		-t "${pkgdir}/usr/share/applications/"

	# Icon
	cp -a "${pkgdir}/opt/apps/com.cmic.yidongbangong/entries/icons/" "${pkgdir}/usr/share/"

	# License
	install -Dm644 ${pkgdir}/opt/apps/com.cmic.yidongbangong/files/{LICENSE.electron.txt,LICENSES.chromium.html} \
		-t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
