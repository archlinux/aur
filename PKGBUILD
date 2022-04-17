# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>
# Previous Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname=ArmCord
pkgname=armcord-bin
pkgver=3.0.5
pkgrel=3
pkgdesc="Discord client for lower end and ARM devices."
arch=('x86_64' 'aarch64')
provides=('armcord')
url="https://github.com/ArmCord/ArmCord"
license=('OSL-3.0')
options=(!strip)

source_x86_64=(
    "armcord.tar.gz::https://github.com/ArmCord/ArmCord/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"
    "armcord.desktop"
    "armcord.png"
)
source_aarch64=(
    "armcord.tar.gz::https://github.com/ArmCord/ArmCord/releases/download/v$pkgver/$_pkgname-$pkgver-arm64.tar.gz"
    "armcord.desktop"
    "armcord.png"
)
sha256sums_x86_64=('aed2faac3c2ebf6239667fc272fba8baaf89862db4c7c0a7954486d792dff8c7'
                   'abda3b8b8f9a46c8a3dd5f24c0e3bddffbf1bf55109864ff218ab79dc500ed05'
                   '173d6ed02a16e9f02f5d4c4b34fe3a46ef29c46ff4ecbbad98747052fb5f954e')
sha256sums_aarch64=('75c05f3a6bc4fa7d3c5cee1f12d791c563a94f700ab098f7d677ae860b695d8f'
                    'abda3b8b8f9a46c8a3dd5f24c0e3bddffbf1bf55109864ff218ab79dc500ed05'
                    '173d6ed02a16e9f02f5d4c4b34fe3a46ef29c46ff4ecbbad98747052fb5f954e')

package() {
    # enter directory
    if [ $CARCH = "x86_64" ]; then
        cd "$srcdir/$_pkgname-$pkgver"
    fi
    if [ $CARCH = "aarch64" ]; then
        cd "$srcdir/$_pkgname-$pkgver-arm64"
    fi

    # Move files to right directories
    install -d "$pkgdir"/opt/armcord
    cp -a * "$pkgdir"/opt/armcord

    # Set up the executables
    install -d "$pkgdir"/usr/bin
    ln -s /opt/armcord/armcord "$pkgdir"/usr/bin/armcord

    # Correct permissions
    chmod +x -R "$pkgdir"/opt/armcord/*
    chmod 755 "$pkgdir"/opt/armcord/armcord

    install -Dm644 "${srcdir}/armcord.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/armcord.png" "${pkgdir}/usr/share/pixmaps/armcord.png"
}
