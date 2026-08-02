# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>
_basename=bifrost
pkgname=${_basename}-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Samsung Firmware Downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/zacharee/Bifrost"
license=('MIT')
provides=("${_basename}")
conflicts=("${_basename}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("https://raw.githubusercontent.com/zacharee/Bifrost/refs/tags/${pkgver}/LICENSE.txt"
    "https://raw.githubusercontent.com/zacharee/Bifrost/refs/tags/${pkgver}/Bifrost.png"
    "https://raw.githubusercontent.com/zacharee/Bifrost/refs/tags/${pkgver}/icon_rounded.svg"
    "${_basename}.desktop")
source_x86_64=("https://github.com/zacharee/Bifrost/releases/download/2.1.2/${_basename}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/zacharee/Bifrost/releases/download/2.1.2/${_basename}-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('778075b8a5fb9c5bc6ea65da17ad6adb0b5c69bbebf52a965d285487dafcd316'
    '8b1803cc34aef2900b66398285f6a9a73ef7d90f098483c2e5dab5334dff905a'
    '1fcfd1fd596d8880d66fcbd80645114f60160bafb29139d58901121cd81d9952'
    'd55e96562676088aff884ce664de0812e3e7c3f73efcd7dc88bacf88e5583c87')
sha256sums_x86_64=('696d7ba243a825effc1d51c5899b2004f11dce257e895403780510e5b1103921')
sha256sums_aarch64=('86be59a37b693863c06bf6497cd457da71e839a7a7e78f748ec5fb9734013757')

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/Bifrost.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_basename}.png"
    install -Dm644 "${srcdir}/icon_rounded.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_basename}.svg"

    install -Dm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"

    cd "${srcdir}/${_basename}-${pkgver}"

    install -Dm755 "bin/${_basename}" "${pkgdir}/usr/lib/${_basename}/bin/${_basename}"

    cp -r "lib" "${pkgdir}/usr/lib/${_basename}/"
    cp -r "share" "${pkgdir}/usr/lib/${_basename}/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/usr/lib/${_basename}/bin/${_basename}" "${pkgdir}/usr/bin/${_basename}"
}
