# Maintainer: Dmitriy Q krotesk <at> mail <dot> ru
pkgname=meshapp-bin
fullpkgname=meshapp-MeshApp
pkgver=2.3.3
pkgrel=3
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
#source=("${url}/releases/download/v${pkgver}/MeshApp-v${pkgver}-x86_64.flatpak")
sha256sums=('c2e00517d562234273a55565dea8a3a42548b16c826d3deaff04156a5ea244fd')

prepare() {
    mkdir -p app
    bsdtar xzf data.tar.zst -C app

    mkdir -p app/usr/share/applications/
    if [ -f "app/opt/${pkgname%-bin}/lib/${fullpkgname}.desktop" ]; then
        mv "app/opt/${pkgname%-bin}/lib/${fullpkgname}.desktop" "app/usr/share/applications/${fullpkgname}.desktop"
    fi
}

package() {
    cp -r app/* "${pkgdir}/"
    if [ -f "${pkgdir}/opt/${pkgname%-bin}/share/doc/copyright" ]; then
        install -D -m644 "${pkgdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
    fi
}