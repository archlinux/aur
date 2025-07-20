# Maintainer: David Cooper <david@dtcooper.com>

pkgname=amplitude-soundboard
pkgver=2.11.0
pkgrel=1
pkgdesc='A sleek, cross-platform soundboard, available for Windows, MacOS, and Linux'
arch=('x86_64')
url='https://amplitude-soundboard.dan0v.com/'
license=('GPL-3.0-or-later')
options=('!strip')
_uppername=AmplitudeSoundboard
_lowername=amplitude_soundboard
_appimage="${_uppername}-${pkgver}-x86_64.AppImage"
source=(
    "${_appimage}::https://github.com/dan0v/${_uppername}/releases/download/${pkgver}/Amplitude_Soundboard-x86_64.AppImage"
)
noextract=("${_appimage}")
sha256sums=('bdae9020323da57818be30106811e6da47eb51e2049b5c7e22e75abaa5e0a61d')

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract

}

build() {
    sed -i "s/\(Icon=\).*/\1${_lowername}/" "${srcdir}/squashfs-root//${_lowername}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -Dm755 "${srcdir}/squashfs-root/${_lowername}.desktop" "${pkgdir}/usr/share/applications/${_lowername}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icn.png" "${pkgdir}/usr/share/pixmaps/${_lowername}.png"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_lowername}"
}
