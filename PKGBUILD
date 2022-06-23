# Maintainer: kylon

pkgname=sharedown
pkgver=4.2.4
pkgrel=1
pkgdesc="Electron application to download Sharepoint videos (especially meant for students)"
arch=('x86_64')
url="https://github.com/kylon/Sharedown"
license=('gpl')
depends=(ffmpeg yt-dlp)
options=(!strip)
source_x86_64=(
	"https://github.com/kylon/Sharedown/releases/download/${pkgver}/${pkgname}-${pkgver}.AppImage"
	"${pkgname}.desktop"
	"icon.png"
)
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=(
	'4163457066db0b120440893077199f63a7f41d22bcf9bc56303e4c4260f0e341'
	'0586bf9de90587649c43c58b8665d97ac41fde8a64e5e239bef07099dbd1e255'
	'42cd3a7ed38456d161af85013b25237c982013204f1c578021eb341c7c864dd7'
)

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/sharedown/icon.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
