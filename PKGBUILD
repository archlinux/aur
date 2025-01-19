# Maintainer: hr567 <hr567@hr567.me>
# Maintainer: HaroldLoui <Riven970309@gmail.com>
# Contributor: witt <1989161762 at qq dot com>
pkgname=apifox
pkgver=2.6.46
pkgrel=1
pkgdesc="API 文档、API 调试、API Mock、API 自动化测试"
arch=("x86_64")
url="https://www.apifox.com/"
license=('custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy' 'fuse2')
source=(
	"${pkgname}-v${pkgver}.zip"::"https://file-assets.apifox.com/download/Apifox-linux-latest.zip"
	"apifox.desktop"
	"apifox.svg")
sha256sums=('cd1ae7ef0d3af6722427488b0fd21ab57ee4aa8203907878da04d2bc0d47b6c2'
            'e89d2d53ce221c59436b7f1f9e4e9c0f2ccf6f55597df2fd16c419c8de5360a9'
            '48dbd5c9727e568c3f19b45d36851eed15fa875a0ca40e83ec35d4e30ecd350d')
options=(!strip)

prepare(){
	./Apifox.AppImage --appimage-extract > /dev/null;
}

pkgver() {
	grep -oP '"version": "\K[^"]+' squashfs-root/resources/app.asar.unpacked/package.json;
}

package() {
	install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/opt/apifox/Apifox.AppImage"
	install -Dm644 "${srcdir}/apifox.desktop" "${pkgdir}/usr/share/applications/apifox.desktop"
	# install -Dm644 "${srcdir}/apifox.svg" "${pkgdir}/usr/share/icons/apifox.svg"
	install -Dm644 "${srcdir}/apifox.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/apifox.svg"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/opt/apifox/Apifox.AppImage" "${pkgdir}/usr/bin"
}
