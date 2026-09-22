# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=0.87.0
pkgrel=1
pkgdesc="AI coding agent for the terminal — minimal, extensible and optimized for tool-use (pi-mono)"
arch=('x86_64' 'aarch64')
url="https://github.com/badlogic/pi-mono"
license=('MIT')
depends=('glibc')
options=(!strip)
optdepends=('tmux: for background bash capabilities')
provides=('pi')
conflicts=('pi')

source=("LICENSE::https://raw.githubusercontent.com/badlogic/pi-mono/v${pkgver}/LICENSE")
source_x86_64=("pi-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v${pkgver}/pi-linux-x64.tar.gz")
source_aarch64=("pi-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://github.com/badlogic/pi-mono/releases/download/v${pkgver}/pi-linux-arm64.tar.gz")

sha256sums=('0457f5bcec3b3b211605dfb5d1a49042fd638f3686a410fe099c24a25af13c48')
sha256sums_x86_64=('f55d02652175cd3f22e6db8223c93ef97a087382abb51dc9ce130fc04de8f746')
sha256sums_aarch64=('1770ab1f71f6fe90ef9c6e233220d8e1420d60ffaa6b5cf137eaf8409ac75907')

package() {
    cd "${srcdir}/pi"

    # Create installation directories
    install -d "${pkgdir}/usr/lib/pi"
    install -d "${pkgdir}/usr/bin"

    # Core binary and runtime assets
    cp -r assets "${pkgdir}/usr/lib/pi/"
    cp -r export-html "${pkgdir}/usr/lib/pi/"
    cp -r theme "${pkgdir}/usr/lib/pi/"
    install -m755 pi "${pkgdir}/usr/lib/pi/pi"
    install -m644 photon_rs_bg.wasm "${pkgdir}/usr/lib/pi/photon_rs_bg.wasm"
    install -m644 package.json "${pkgdir}/usr/lib/pi/package.json"

    # Symlink binary to /usr/bin
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"

    # Documentation and examples
    cp -r docs "${pkgdir}/usr/lib/pi/"
    cp -r examples "${pkgdir}/usr/lib/pi/"
    install -m644 README.md "${pkgdir}/usr/lib/pi/README.md"
    install -m644 CHANGELOG.md "${pkgdir}/usr/lib/pi/CHANGELOG.md"

    # License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
