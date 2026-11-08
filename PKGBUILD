# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=donuttaskmanager-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="GTK4/libadwaita task manager and performance monitor for Linux (formerly Task Manager)"
arch=('x86_64')
url="https://github.com/DonutsDelivery/task-manager-linux"
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'dbus' 'hicolor-icon-theme')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring via NVML'
    'lm_sensors: CPU temperature monitoring'
)
provides=('donuttaskmanager' 'task-manager-linux' 'task-manager-linux-bin')
conflicts=('donuttaskmanager' 'task-manager-linux' 'task-manager-linux-bin')
replaces=('task-manager-linux-bin')
source=("DonutTaskManager-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/DonutTaskManager-x86_64.tar.gz")
sha256sums=('4c835373d6f6a758eca2c158d43f31b66250e392cead08d477a0d35bba808c8b')

package() {
    cd "$srcdir/DonutTaskManager"
    local appid=online.donutsdelivery.DonutTaskManager
    install -Dm755 donut-taskmgr "$pkgdir/usr/bin/donut-taskmgr"
    install -Dm644 "$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
    install -d "$pkgdir/usr/share/icons"
    cp -r hicolor "$pkgdir/usr/share/icons/"
    install -Dm644 "$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm755 setup-shortcut.sh "$pkgdir/usr/share/donut-taskmgr/setup-shortcut.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
