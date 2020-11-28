# Maintainer: Harsh Barsaiyan <hbarsaiyan@gmail.com>
 
pkgname=youtube-music
_pkgname=YouTube-Music
pkgver=1.6.4
pkgrel=1
epoch=
pkgdesc="YouTube Music Desktop App bundled with custom plugins like built-in ad blocker & downloader"
arch=('x86_64')
url="https://github.com/th-ch/youtube-music"
license=('MIT')
makedepends=('git')
source=("https://github.com/ytmdesktop/ytmdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
		"https://raw.githubusercontent.com/th-ch/youtube-music/master/license"
        "youtube-music-th-ch.desktop")
noextract=('${_pkgname}-${pkgver}.AppImage')
options=(!strip)
sha512sums=(
            "d9b75e151e609bde9694c960f7b9ff40f1681d338b575d86948780a6f47a5a58183b5506e9e0c22b39594682d39fea1b40d969dfbe3a32ede11492b06c96bfcb"
            "49c9004d9a157e3ddc4e79b6a800f0ac320989967a86ce887e5f8658c263167d43afa510f5692da86608bda1b98418e4fa9b012d9920c501f11304226136e031"
            "e1ee2d1a375bad265233aa13b33d3b5019318108307451485a3e579d4b03c0b0a47c72c8b61951a430d3cc9f1dc57118704f458bbf52df4ddc5ea9261efc7ffe"
)

prepare(){
	chmod +x $_pkgname-$pkgver.AppImage
	./$_pkgname-$pkgver.AppImage --appimage-extract
}
 
package() {
	# install license
	install -Dm644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"
 
	# install icon
	install -Dm644 "${srcdir}/squashfs-root/youtube-music.png" "${pkgdir}/usr/share/pixmaps/youtube-music.png"
 
	# install appimage
	install -Dm755 ${_pkgname}-${pkgver}.AppImage "${pkgdir}/usr/bin/youtube-music-th-ch"
 
	# install desktop entry
	install -Dm755 youtube-music-th-ch.desktop "${pkgdir}/usr/share/applications/youtube-music-th-ch.desktop"
}

            

