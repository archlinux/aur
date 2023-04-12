# Contributor: solopasha <daron439 at gmail dot com>
# Maintainer: asuka minato

pkgname=remnote
pkgver=1.9.45
pkgrel=1
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64')
depends=()
url="https://www.remnote.com"
license=('custom:Commercial')
options=(!strip)
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download.remnote.io/remnote-desktop/RemNote-$pkgver.AppImage")
noextract=("${_appimage}")
sha256sums=('934b1eeed25232f19d7f9db501fc5cc522998483b1997331b643a96303653f5b')

prepare() {
	chmod +x $_appimage
	./$_appimage --appimage-extract
	sed -i -e "s|^Exec=.*|Exec=/usr/bin/$pkgname|" \
		-e '/^X-AppImage-Version=.*/d' \
		-e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
}

package() {
	install -Dm755 "RemNote-$pkgver.AppImage" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
