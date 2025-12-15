# Maintainer: RevenantX <doomrevx at gmail dot com>
pkgname=ppd-tray-applet-git
_pkgname=ppd-tray-applet
pkgver=1
pkgrel=1
epoch=
pkgdesc="A simple tray applet for power-profiles-daemon to manage power profiles"
arch=('x86_64' 'aarch64')
url="https://github.com/RevenantX/ppd-tray-applet.git"
license=('MIT')
groups=()
depends=(
    'glibc'
    'dbus'
    'power-profiles-daemon'
)
makedepends=(
    'git'
    'go>=1.22.0'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !lto !debug)
install=
changelog=
source=("git+https://github.com/RevenantX/ppd-tray-applet.git")
sha256sums=('SKIP')

prepare() {
    cd "${_pkgname}"
    go mod tidy
}

build() {
    cd "${_pkgname}"
    go build -o ppd-tray-applet -ldflags="-w -s" .
}

package() {
    cd "${_pkgname}"

    # Install binary
    install -Dm755 ppd-tray-applet "${pkgdir}/usr/bin/ppd-tray-applet"

    # Install icons
    install -Dm644 assets/balanced.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ppd-tray-applet-balanced.png"

    # Install desktop file
    install -Dm644 ppd-tray-applet.desktop "${pkgdir}/usr/share/applications/ppd-tray-applet.desktop"

    # Install autostart file for xdg autostart
    install -Dm644 ppd-tray-applet.desktop "${pkgdir}/etc/xdg/autostart/ppd-tray-applet.desktop"
}
