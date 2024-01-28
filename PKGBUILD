# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>
# Previous Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname=ArmCord
pkgname=armcord-bin
pkgver=3.2.6
pkgrel=2
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
sha256sums_x86_64=('c89ed5ee8fef245d2a6214afb2a7eabeec650d15b5f7e12c76eadf2d41f7b980'
                   '815f0c12cc6c8df07a16e7b8769fd3cc6e80032574e2431d4c5a9487d76065a0'
                   '173d6ed02a16e9f02f5d4c4b34fe3a46ef29c46ff4ecbbad98747052fb5f954e')
sha256sums_aarch64=('38e159f4cd21a0e6f87e77815d5fb030724bcd9d8f5da1b1434c2f4ba0b814fc'
                    '815f0c12cc6c8df07a16e7b8769fd3cc6e80032574e2431d4c5a9487d76065a0'
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
