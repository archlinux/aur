# Maintainer: Hussein Hareb <husseinhareb@proton.me>
pkgname=hw-monitor
pkgver=0.0.3
pkgrel=1
pkgdesc="A lightweight hardware monitor built with Tauri"
arch=('x86_64')
url="https://github.com/husseinhareb/hw-monitor"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'glib2' 'dbus' 'hicolor-icon-theme')
optdepends=('nvidia-utils: NVIDIA GPU monitoring')
conflicts=('hw-monitor-git')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/husseinhareb/hw-monitor/releases/download/v${pkgver}/hw-monitor_${pkgver}_amd64.deb")
sha256sums=('2ce9e32c3c0c22d93df97f34559dbd2e84cd03f41f11da827a4530607354955f')

package() {
    cd "${srcdir}"
    # Unpack the .deb (ar archive) to get data.tar.gz
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    # Extract file tree into pkgdir
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Ensure binary is executable
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
