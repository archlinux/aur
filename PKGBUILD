# Maintainer: ludvig2457 <ludvig2457@archlinux.org>

pkgname=superlauncher
pkgver=2.0.0
pkgrel=1
pkgdesc="Minecraft launcher with mod support and server management"
arch=('any')
url="https://github.com/Ludvig2457Ultra/SuperLauncherMC-for-linux"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-pillow'
)
optdepends=(
    'python-pypresence: Discord Rich Presence'
    'python-cryptography: encrypted storage'
    'python-psutil: system resource monitoring'
    'python-pyjwt: JWT authentication'
    'python-minecraft-launcher-lib: Minecraft version management'
    'jdk17-openjdk: run Minecraft Java Edition'
)
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('90eb227e8f7c473320e5d92ce6f590e2f009b9ff3c340d179cac734f9d15bed7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 superlauncher.py "$pkgdir/usr/share/superlauncher/superlauncher.py"

    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/superlauncher" << 'WRAPPER'
#!/usr/bin/env bash
exec python3 /usr/share/superlauncher/superlauncher.py "$@"
WRAPPER
    chmod +x "$pkgdir/usr/bin/superlauncher"

    install -Dm644 superlauncher.desktop \
        "$pkgdir/usr/share/applications/superlauncher.desktop"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/superlauncher.png"

    cp -r assets "$pkgdir/usr/share/superlauncher/assets"
}
