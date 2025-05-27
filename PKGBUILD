pkgname=jdsystemmonitor
pkgver=2.0
pkgrel=1
pkgdesc="Monitor your system"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdSystemMonitor"
license=("GPL3")
depends=("qt6-base" "qt6-charts" "xdg-desktop-portal" "polkit" "xdg-dbus-proxy" "hicolor-icon-theme")
makedepends=("meson" "go" "qt6-tools" "python")
optdepends=("packagekit: See installed pacman packages" "jdsimpleautostart: Edit the autostart")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSystemMonitor/archive/${pkgver}.tar.gz")
sha256sums=("d804154e68d97c2f896907512267c8497ead628031398a8532a516dcdbdbc7c9")

build() {
    cd jdsystemmonitor
    arch-meson build
    meson compile -C build
}

package() {
    cd jdsystemmonitor
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
