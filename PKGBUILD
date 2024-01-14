# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.1.5
pkgrel=3
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('x86_64')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-pynitrokey' 'pyside6' 'python-qt-material' 'qt6-tools' 'python-pyudev')
makedepends=('python-poetry')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    "$pkgname.svg::https://raw.githubusercontent.com/Nitrokey/nitrokey-app2/main/nitrokeyapp/ui/icons/nitrokey-app-icon-vector.svg"
    "$pkgname.desktop"
)
sha256sums=('a439b98d4304597d91c90812e8ae366b209015295e21045330e1141fe48c4e5e'
            'e49609f53b375f9eb69d7024699e403ad6913f40453bfe2bdf1bab362e78206e'
            'de1159ce2334742b1c5fb8e521b05ccb6adff53603902579d568199e145de288')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
    install -Dv nitrokey-app2.desktop "$pkgdir/usr/share/applications/nitrokey-app2.desktop"
    install -Dv nitrokey-app2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nitrokey-app2.svg"

    cd ${pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
