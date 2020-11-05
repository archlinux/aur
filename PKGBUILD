# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>
 
pkgname=youtube-music-appimage
_pkgname=YouTube-Music-Desktop-App
pkgver=1.13.0
pkgrel=2
epoch=
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
makedepends=('git')
source=("https://github.com/ytmdesktop/ytmdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
		"https://raw.githubusercontent.com/ytmdesktop/ytmdesktop/master/LICENSE.md"
        "youtube-music.desktop")
noextract=('${_pkgname}-${pkgver}.AppImage')
options=(!strip)
sha512sums=(
	"7a5f9f85764d9d40957ec843bb62ddff0bf06f267dc283d7d2023278b5cf922dc8bad69f6bac004ee7ce67e7b71ebcf6a919679f16f4217c5832f7fc45c93c4b"
	"SKIP"
	"42b2b37c32da575e3c79b6c5ef911c17147c371794941424b047555be00e86b79e6ee462275f2bec0380ddee09e0d3fed82182096787878a7eefb3d53542d061"
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