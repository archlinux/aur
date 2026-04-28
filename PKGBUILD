# Maintainer: RiDDiX <github@egu-rel.de>

pkgname=adguard-tray
pkgver=1.6.6
pkgrel=1
pkgdesc="System tray monitor and controller for adguard-cli (KDE Plasma & Hyprland)"
arch=('any')
url="https://github.com/RiDDiX/adguard-tray"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-yaml'
    'libnotify'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'adguard-cli-bin: AdGuard CLI via AUR (alternatively install upstream: curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardCLI/release/install.sh | sh -s -- -v)'
    'qt6-svg: SVG icon theme support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0b4e37165f5ceedb378611ac3cedf083c2cc0383cd0240483d298e7aa4685cef')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 adguard-tray.desktop -t "$pkgdir/usr/share/applications/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
