pkgname=jdsystemmonitor
pkgver=1.0
pkgrel=1
pkgdesc="Monitor your system"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdSystemMonitor"
license=("GPL3")
depends=("qt6-base" "qt6-charts" "xdg-desktop-portal" "polkit" "xdg-dbus-proxy" "hicolor-icon-theme")
makedepends=("meson" "go" "qt6-tools" "python")
optdepends=("packagekit: See installed pacman packages")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSystemMonitor/archive/${pkgver}.tar.gz")
sha256sums=("418c4fc6baee80081398c175da436b8d5361d66ca360464244478b48b35f299c")

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
