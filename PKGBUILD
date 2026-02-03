# Source: https://launcher.hytale.com/version/release/launcher.json
# Maintainer: SCDevel <root@scdevel.net>

_version=2026.02.02-abc3fcb

pkgname=hytale-launcher-bin
pkgver=${_version%-*}
pkgrel=1
pkgdesc="Hytale Launcher (Native Linux, Self-Updating) [${_version}]"
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

source=("hytale-launcher-${_version}.zip::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-${_version}.zip"
        "hytale-launcher.install"
        "hytale-launcher.sh"
        "nautilus-fix.sh"
        "com.hypixel.HytaleLauncher.png"
        "com.hypixel.HytaleLauncher.desktop"
        "LICENSE")

# generated with: updpkgsums
sha256sums=('0a58b99f589aed8bfabfdbfe3db05ee2b0b3fc1c521b87b3909acbf80cb239ba'
            '0835afe0aec4f086c72518512bf64bfa55679242f3214ca6542fb0fcadd150b9'
            '2f82dd197e945fe2be168fcc267396273dfaf7015f65b28baf32a8f2f5960e72'
            '4ba4ac60ef66d32e4bb243e3bfa0ffc59322d6a88262a398198a0b2c6e365a52'
            '2ac413e944bff6afba669883dd6686c7f08aa77708b06d8492177fcd48fd6b2c'
            '8aa7dc98faa3a094f5a2ae8c0ad1ff7a65d295b8b3705c5707ec184570d67195'
            '5782bcd7945501383cd6b589797549318cb8e494047c31944fc326ff51ae7047')

package() {
    install -Dm755 "${srcdir}/hytale-launcher" "${pkgdir}/opt/${pkgname}/hytale-launcher"
    install -Dm755 "${srcdir}/hytale-launcher.sh" "${pkgdir}/usr/bin/hytale-launcher"

    # temporary fix for nautlius crash
    install -Dm755 "${srcdir}/nautilus-fix.sh" "${pkgdir}/opt/hytale-launcher-bin/nautilus-fix/nautilus"

    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.hypixel.HytaleLauncher.png"
    install -Dm644 "${srcdir}/com.hypixel.HytaleLauncher.desktop" "${pkgdir}/usr/share/applications/com.hypixel.HytaleLauncher.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
