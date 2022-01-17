# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>
# Previous Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname=ArmCord
pkgname=armcord-bin
pkgver=3.0.3
pkgrel=3
pkgdesc="Discord client for lower end and ARM devices."
arch=('x86_64' 'aarch64')
provides=('armcord')
url="https://github.com/ArmCord/ArmCord"
license=('OSL-3.0')
options=(!strip)

source_x86_64=(
    "armcord.tar.gz::https://github.com/smartfrigde/armcord/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"
    "armcord.desktop"
)
sha256sums_x86_64=(
    "7168ebebc6ba398e24e7cb77f138cf08a5f230f8777ca309b187be68fba4f130"
    "004d097517ea3fa1420fb8b1066c197089fb79d9a2f5d52f49ea573e9277fe2f"
)
source_aarch64=(
    "armcord.tar.gz::https://github.com/ArmCord/ArmCord/releases/download/v$pkgver/$_pkgname-$pkgver-arm64.tar.gz"
    "armcord.desktop"
)
sha256sums_aarch64=(
    "845904d8890fbe5b4dd36b576d7fe5ef352d6c0a13ddae6f2193c2bcbf17b1b7"
    "004d097517ea3fa1420fb8b1066c197089fb79d9a2f5d52f49ea573e9277fe2f"
)

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
}
