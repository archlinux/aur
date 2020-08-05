# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>

pkgname=youtube-music-appimage
_pkgname=YouTube.Music.Desktop.App
pkgver=1.12.0
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
	a48bbd8ac2e093a218e3bdc66806f8f068603687d8b51d0b595874f6cb2e6b2b
	b119b59f470d03a9a42161579d64a10873f28aebba40db2454152a11ef7f3b5c
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
	install -Dm644 "${srcdir}/squashfs-root/youtube-music-desktop-app.png" "${pkgdir}/usr/share/pixmaps/ytmdesktop.png"
	
	# install appimage
	install -Dm755 ${_pkgname}-${pkgver}.AppImage "${pkgdir}/usr/bin/youtube-music"
	
	# install desktop entry
	install -Dm755 youtube-music.desktop "${pkgdir}/usr/share/applications/youtube-music.desktop"
}