# Maintainer: Jan Damek <jan@damek-soft.eu>
#
# WARNING: This is a third-party Discord client. Use at your own risk.
# Discord ToS prohibits third-party user clients. Account suspension risk.
# See: https://github.com/JanDamek/puklic#%EF%B8%8F-disclaimer

pkgname=puklic-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight native Discord client (Compose Multiplatform, Kotlin Multiplatform)"
arch=('x86_64')
url="https://github.com/JanDamek/puklic"
license=('GPL3')
depends=('libsecret' 'libdbus' 'java-runtime>=21')
optdepends=(
    'libayatana-appindicator: System tray icon support'
    'pipewire: Voice chat audio backend'
    'xdg-desktop-portal: Screen sharing on Wayland'
    'wl-clipboard: Wayland clipboard support'
)
provides=("puklic=${pkgver}")
conflicts=('puklic')

source=("puklic_${pkgver}-${pkgrel}_amd64.deb::https://github.com/JanDamek/puklic/releases/download/v${pkgver}/puklic_${pkgver}-1_amd64.deb")
sha256sums=('9714bcea4e4c523910e97776d24f9ca5ea673c02632761745cc9456c46659d46')

install="${pkgname}.install"

package() {
    cd "$srcdir"
    # Extract .deb (Debian package = ar archive containing data.tar.zst)
    ar x "puklic_${pkgver}-${pkgrel}_amd64.deb"
    tar -xf data.tar.* -C "$pkgdir"
    # Cleanup: remove .deb-specific paths if any
    rm -rf "$pkgdir/DEBIAN"
}
