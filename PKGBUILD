# Maintainer: Hussein Hareb <hussein.hareb04@gmail.com>
pkgname=hw-monitor
pkgver=0.4.0
pkgrel=1
pkgdesc="A lightweight hardware monitor built with Tauri"
arch=('x86_64')
url="https://github.com/husseinhareb/hw-monitor"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'glib2' 'dbus' 'hicolor-icon-theme')
optdepends=('nvidia-utils: NVIDIA GPU monitoring')
conflicts=('hw-monitor-git')
options=('!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/husseinhareb/hw-monitor/releases/download/v${pkgver}/hw-monitor_${pkgver}_amd64.deb"
)
sha256sums=(
    'SKIP'
)

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
