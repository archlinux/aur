# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>

pkgname=youtube-music-appimage
_pkgname=YouTube.Music.Desktop.App
pkgver=1.11.0
pkgrel=1
epoch=
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
makedepends=('git')
source=("https://github.com/ytmdesktop/ytmdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
		"https://github.com/ytmdesktop/ytmdesktop/blob/master/LICENSE.md"
        "youtube-music.desktop")
noextract=('${_pkgname}-${pkgver}.AppImage')
options=(!strip)
sha256sums=(
	SKIP
	SKIP
	4c328cb3457c355ac7eec7778971abe962c283f3883d9f360a6c3352d3950ae6
)

prepare(){
	chmod +x $_pkgname-$pkgver.AppImage
	./$_pkgname-$pkgver.AppImage --appimage-extract
}

package() {
	# install license
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/ytmdesktop/LICENSE.md"
	
	# install icon
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/youtube-music-desktop-app.png" "${pkgdir}/usr/share/pixmaps/ytmdesktop.png"
	
	# install appimage
	install -Dm755 ${_pkgname}-${pkgver}.AppImage "${pkgdir}/usr/bin/youtube-music"
	
	# install desktop entry
	install -Dm755 youtube-music.desktop "${pkgdir}/usr/share/applications/youtube-music.desktop"
}