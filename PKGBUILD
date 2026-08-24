# Maintainer: Raphael <raphael.girard.iut@gmail.com>
pkgname=something-x
pkgver=1.9.1
pkgrel=1
pkgdesc="GTK4 device manager for Nothing earbuds on Linux"
arch=('any')
url="https://github.com/SoaOaoS/nothingonmarchy"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('libpulse: volume control via pactl')
source=("https://files.pythonhosted.org/packages/source/s/something-x/something_x-${pkgver}.tar.gz")
sha256sums=('3e6b411f98a6c00e444e8230ef1b02e34da9a993fa5e5b4f603ee2a0fb93bce9')

prepare() {
    cd "something_x-${pkgver}"
    sed -i 's/, "setuptools-scm>=8"//' pyproject.toml
}

build() {
    cd "something_x-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "something_x-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
