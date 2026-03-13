# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.6.0
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('any')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-nitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'qt6-svg' 'python-pyudev' 'hicolor-icon-theme' 'python-usb_monitor')
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c1fe76ad2f0773f91b4d41b4257f6218a6eabca5f7bdbd7bef87ad697cf82df')

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
