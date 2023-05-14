# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>
# Previous Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname=ArmCord
pkgname=armcord-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Discord client for lower end and ARM devices."
arch=('x86_64' 'aarch64')
provides=('armcord')
url="https://github.com/ArmCord/ArmCord"
license=('OSL-3.0')
options=(!strip)

source_x86_64=(
    "https://github.com/ArmCord/ArmCord/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"
    "armcord.desktop"
    "armcord.png"
)
source_aarch64=(
    "https://github.com/ArmCord/ArmCord/releases/download/v$pkgver/$_pkgname-$pkgver-arm64.tar.gz"
    "armcord.desktop"
    "armcord.png"
)
sha256sums_x86_64=('ca8b48162ec02ce7db3702a705fd68b64db46ef71965753dea1933ea788a2e38'
                   'abda3b8b8f9a46c8a3dd5f24c0e3bddffbf1bf55109864ff218ab79dc500ed05'
                   '173d6ed02a16e9f02f5d4c4b34fe3a46ef29c46ff4ecbbad98747052fb5f954e')
sha256sums_aarch64=('9d2a8f34f663d2d811216934032d923eeb0150ca4eee0b3f2017c2925a3b521e'
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
