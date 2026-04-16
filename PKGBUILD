# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-gui
pkgver=1.0.4
pkgrel=1
pkgdesc="PySide6 desktop GUI for the Control-OFC fan control daemon"
arch=('any')
url="https://github.com/Plan-B-Development/control-ofc-gui"
license=('MIT')
depends=('control-ofc-daemon' 'python' 'pyside6' 'python-httpx'
         'python-pyqtgraph' 'python-numpy' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
install=control-ofc-gui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f8b2581c7a6a6548211bdc21a0107003a3c50ab4f93bb87ff89f3dc6454a79b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install Python package (creates /usr/bin/control-ofc-gui from entry point)
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 packaging/control-ofc-gui.desktop "$pkgdir/usr/share/applications/control-ofc-gui.desktop"

    # Application icon
    install -Dm644 assets/branding/app_icon/app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/control-ofc.svg"

    # Branding assets (splash, banner — used at runtime)
    install -Dm644 assets/branding/splash/splash.png "$pkgdir/usr/share/control-ofc-gui/assets/branding/splash/splash.png"
    install -Dm644 assets/branding/banner.png "$pkgdir/usr/share/control-ofc-gui/assets/branding/banner.png"
    install -Dm644 assets/branding/banner_original.png "$pkgdir/usr/share/control-ofc-gui/assets/branding/banner_original.png"
    install -Dm644 assets/branding/app_icon/app_icon.svg "$pkgdir/usr/share/control-ofc-gui/assets/branding/app_icon/app_icon.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
