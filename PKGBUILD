# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.4.1
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('any')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-nitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'qt6-svg' 'python-pyudev' 'hicolor-icon-theme' 'python-usb_monitor')
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f7d02fce01a95b0ee8e8e1bd3ec09b0f5452b3cf003e5cbbd8559c7df4c07b7')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dv meta/com.nitrokey.nitrokey-app2.desktop "$pkgdir/usr/share/applications/com.nitrokey.nitrokey-app2.desktop"
    install -Dvm 644 meta/nk-app2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.nitrokey.nitrokey-app2.svg"
}
