# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>
_basename=bifrost
pkgname=${_basename}-bin
pkgver=2.1.0
pkgrel=2
pkgdesc="Samsung Firmware Downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/zacharee/SamloaderKotlin"
license=('MIT')
provides=("${_basename}")
conflicts=("${_basename}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/LICENSE.txt"
    "https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/Bifrost.png"
    "https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/icon_rounded.svg"
    "${_basename}.desktop")
source_x86_64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_basename}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_basename}-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('778075b8a5fb9c5bc6ea65da17ad6adb0b5c69bbebf52a965d285487dafcd316'
    '8b1803cc34aef2900b66398285f6a9a73ef7d90f098483c2e5dab5334dff905a'
    '1fcfd1fd596d8880d66fcbd80645114f60160bafb29139d58901121cd81d9952'
    'd55e96562676088aff884ce664de0812e3e7c3f73efcd7dc88bacf88e5583c87')
sha256sums_x86_64=('6b916e2ad7c73387f5496c123a055c152d46925f2bcdce6c6374fe7210ea37a4')
sha256sums_aarch64=('52064c5080f6fd541e540a45210f9f9b2bbe47316754010661c55e0a94eea0ae')

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
