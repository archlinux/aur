# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-launcher-bin
pkgver=2026.01.14.cabac20
pkgrel=1
pkgdesc="Hytale Launcher (Native Linux, Self-Updating)"
url="https://hytale.com"
license=('LicenseRef-custom')
arch=('x86_64')
options=('!strip' '!debug')
provides=('hytale-launcher')
conflicts=('hytale-launcher')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'bash' 'xdg-utils' 'libsoup3' 'gdk-pixbuf2' 'glib2' 'glibc')
optdepends=('systemd: Required to check System Time Synchronization.'
            'iproute2: Required to check IPV6 status')
install="hytale-launcher.install"

# We split the pkgver back into the date and commit parts for the URL
_date=$(echo $pkgver | cut -d. -f1-3)
_commit=$(echo $pkgver | cut -d. -f4)

source=("hytale-launcher-${_date}-${_commit}.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_date}-${_commit}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "com.hypixel.HytaleLauncher.png"
        "com.hypixel.HytaleLauncher.desktop"
        "LICENSE")

# generated with: updpkgsums
sha256sums=('6b4bfe603f707555ba7916eae381b8bb5e059d2032f7745b99cef9b3544592b3'
            'c1e7000c3965bf556f41e799f6a75952fa4b557e6658fe0f32082e048ea5b2cf'
            '6c22162d5d665ee9dee90f7a9e3790d4ec3d296e7ea734cfddee23a503fed7f7'
            'ed125c07488c20211119668cd09f73eff4f36fa017f78c1d331388c5af507106'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
