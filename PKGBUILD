# Maintainer: RiDDiX <github@egu-rel.de>

pkgname=adguard-tray
pkgver=2.0.0
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
    'polkit'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'adguard-cli-bin: AdGuard CLI via AUR (alternatively install upstream: curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardCLI/release/install.sh | sh -s -- -v)'
    'qt6-svg: sidebar and toolbar icons in the Manager window'
    'nss: install the HTTPS certificate into browsers (certutil)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('23384ac5b3bde92718fee8fc21bbe845ab20c9c99851e662cfaa6da1d8061d1c')

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
