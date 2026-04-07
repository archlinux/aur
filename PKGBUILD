# Maintainer: Jim Dougherty <joconno2 at github>
pkgname=kwin-health-monitor-git
pkgver=r2.3b4940b
pkgrel=1
pkgdesc="System tray monitor for KWin Wayland compositor health (memory, FDs, VRAM)"
arch=('any')
url="https://github.com/joconno2/kwin-health-monitor"
license=('MIT')
depends=('python' 'python-pyqt6')
optdepends=('nvidia-utils: GPU VRAM monitoring for NVIDIA cards')
makedepends=('git')
install=kwin-health-monitor.install
provides=('kwin-health-monitor')
conflicts=('kwin-health-monitor')
source=("${pkgname}::git+https://github.com/joconno2/kwin-health-monitor.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 kwin-health-monitor.py "$pkgdir/usr/bin/kwin-health-monitor"
    install -Dm644 kwin-health-monitor.desktop "$pkgdir/usr/share/applications/kwin-health-monitor.desktop"
    install -Dm644 config.toml.example "$pkgdir/usr/share/kwin-health-monitor/config.toml.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
