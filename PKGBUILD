# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.2.1
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('x86_64')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-pynitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'python-pyudev')
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da869c32357e297e19b9a2ef4c9d06b891d9ac1201be86f91064aa3c425fdd63')

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
