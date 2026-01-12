# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-launcher-bin
pkgver=2026.01.12.e43ec47
pkgrel=2
pkgdesc="Hytale Launcher (Native Linux, Self-Updating)"
url="https://hytale.com"
license=('LicenseRef-custom')
arch=('x86_64')
options=('!strip' '!debug')
provides=('hytale-launcher')
conflicts=('hytale-launcher')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'bash' 'xdg-utils' 'libsoup3' 'gdk-pixbuf2' 'glib2' 'glibc')
optdepends=('jdk25-openjdk: Required to Run / Mod Hytale client/server'
            'jre25-openjdk: Required to Run Hytale client/server'
            'curl: Required to Upload Debug Info'
            'mesa-utils: Required to get glxinfo (debugging)' )
install="hytale-launcher.install"

# We split the pkgver back into the date and commit parts for the URL
_date=$(echo $pkgver | cut -d. -f1-3)
_commit=$(echo $pkgver | cut -d. -f4)

source=("hytale-launcher-${_date}-${_commit}.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_date}-${_commit}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "hytale-debug.sh"
        "com.hypixel.HytaleLauncher.png"
        "com.hypixel.HytaleLauncher.desktop"
        "LICENSE")

# generated with: updpkgsums
sha256sums=('e3ff4eca14932ef7051dad5f1a9a646aca72b4b62f7ea263faa6f92fc03b76ab'
            '478fab131e10b31197bcfd37771d1475b4617bbaca7bf8c8e31c1a49824a21e5'
            '293914da7d28d9d855ad9ea157d66127dee8793f6f69a7cce5088a8b0a245002'
            '60cf8a13acd89cc21ac9fe40ea0eb8b7dd30ef23831558b56716835fdb29c5b0'
            'ed125c07488c20211119668cd09f73eff4f36fa017f78c1d331388c5af507106'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-debug.sh" "${pkgdir}/opt/${pkgname}/hytale-debug.sh"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
