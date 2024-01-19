# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.1.5
pkgrel=4
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('x86_64')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-pynitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'python-pyudev')
makedepends=('python-poetry')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    "com.nitrokey.nitrokey-app2.svg::https://raw.githubusercontent.com/Nitrokey/nitrokey-app2/main/meta/nk-app2.svg"
    "https://raw.githubusercontent.com/Nitrokey/nitrokey-app2/main/meta/com.nitrokey.nitrokey-app2.desktop"
)
sha256sums=('a439b98d4304597d91c90812e8ae366b209015295e21045330e1141fe48c4e5e'
            'e49609f53b375f9eb69d7024699e403ad6913f40453bfe2bdf1bab362e78206e'
            '1cc17345bd19533fe6e62bcaab68fa4e07980ba163925f92a190f563405f241c')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
    install -Dv com.nitrokey.nitrokey-app2.desktop "$pkgdir/usr/share/applications/com.nitrokey.nitrokey-app2.desktop"
    install -Dvm 544 com.nitrokey.nitrokey-app2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.nitrokey.nitrokey-app2.svg"

    cd ${pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
