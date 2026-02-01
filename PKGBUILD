# Maintainer: Your Name <your.email@example.com>
pkgname=opentaiko-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Open source Taiko no Tatsujin rhythm game clone (Linux binaries)"
arch=('x86_64')
url="https://github.com/OpenTaiko/OpenTaiko"
license=('MIT')
depends=('dotnet-runtime' 'sdl2' 'openal' 'ffmpeg' 'libx11' 'libxrandr')
provides=('opentaiko')
conflicts=('opentaiko-git')
source=("https://github.com/OpenTaiko/OpenTaiko/releases/download/v${pkgver}/OpenTaiko-v${pkgver}-Linux.tar.gz")
sha256sums=('SKIP')

package() {
    # Create necessary directories
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    # Copy game files to /opt
    cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname}/"

    # Remove the source archive if it was extracted into the same folder
    rm -rf "${pkgdir}/opt/${pkgname}/OpenTaiko-v${pkgver}-Linux.tar.gz"

    # Set up a symbolic link for easy execution
    ln -s "/opt/${pkgname}/OpenTaiko" "${pkgdir}/usr/bin/opentaiko"

    # Ensure the main binary is executable
    chmod +x "${pkgdir}/opt/${pkgname}/OpenTaiko"
}
