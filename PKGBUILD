# Maintainer: DonutsDelivery
pkgname=task-manager-linux-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="GTK4/libadwaita system task manager and performance monitor for Linux"
arch=('x86_64')
url="https://github.com/DonutsDelivery/task-manager-linux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring via NVML'
    'lm_sensors: CPU temperature monitoring'
)
provides=('task-manager-linux')
conflicts=('task-manager-linux')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DonutsDelivery/task-manager-linux/releases/download/v${pkgver}/task-manager-linux-x86_64.tar.gz")
sha256sums=('911488ef8fe0d13270b781cf8a7d48b590f57b9cabe1ff5af872ceda1925923b')

package() {
    install -Dm755 "${srcdir}/task-manager-linux/task-manager-linux" "${pkgdir}/usr/bin/task-manager-linux"

    # Icon
    install -Dm644 "${srcdir}/task-manager-linux/task-manager-linux.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/task-manager-linux.svg"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/task-manager-linux.desktop" << DESKTOP
[Desktop Entry]
Type=Application
Name=Task Manager
GenericName=System Monitor
Comment=System process manager and performance monitor
Exec=task-manager-linux
Icon=task-manager-linux
Terminal=false
Categories=System;Monitor;
Keywords=task;process;system;monitor;cpu;memory;gpu;
StartupNotify=true
DESKTOP
}
