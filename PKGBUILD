# Maintainer: Dmitriy Q krotesk <at> mail <dot> ru
pkgname=meshapp-bin
fullpkgname=meshapp-MeshApp
pkgver=2.0.17
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
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('4fc64da309dae807112574b3567e25f68bc9a7332671f22408be2c612b491009')

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
