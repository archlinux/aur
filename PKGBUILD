# Maintainer: Dmitriy Q krotesk <at> mail <dot> ru
pkgname=meshapp-bin
fullpkgname=meshapp-MeshApp
pkgver=2.2.4
pkgrel=1
pkgdesc="A full-featured desktop client for managing devices and communication in the Meshtastic mesh network."
arch=('any')
url="https://git.privatepractice.app/covox/meshapp"
license=('GPL3')
depends=('alsa-lib' 'brotli' 'libbsd' 'bzip2' 'glibc' 'libcap' 'freetype2' 'libgcc' 'libgcrypt' 'giflib'
         'glib2' 'libgpg-error' 'graphite' 'harfbuzz' 'libjpeg-turbo' 'lcms2' 'lz4' 'xz' 'libmd' 'pcre2'
         'pcsclite' 'libpng' 'libstdc++' 'systemd-libs' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext'
         'libxi' 'libxrender' 'libxtst' 'zstd' 'xdg-utils' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
#source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${url}/releases/download/v${pkgver}/MeshApp-v${pkgver}-x86_64.flatpak")
sha256sums=('5628cf904e52a1c72de4834a089f73c3bd41654f550439a2fe4383a731358300')

prepare(){
    bsdtar xzf data.tar.zst -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mv "${pkgdir}/opt/${pkgname%-bin}/lib/${fullpkgname}.desktop" "${pkgdir}/usr/share/applications/${fullpkgname}.desktop"
    install -D -m644 "${pkgdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

package(){
    bsdtar xzf data.tar.zst -C "${pkgdir}"
    install -d "${pkgdir}/opt/${pkgname%-bin}"
}
