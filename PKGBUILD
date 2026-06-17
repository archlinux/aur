# Maintainer: Raphael <raphael.girard.iut@gmail.com>
pkgname=something-x
pkgver=1.9.0
pkgrel=1
pkgdesc="GTK4 device manager for Nothing earbuds on Linux"
arch=('any')
url="https://github.com/SoaOaoS/nothingonmarchy"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('libpulse: volume control via pactl')
source=("https://files.pythonhosted.org/packages/source/s/something-x/something_x-${pkgver}.tar.gz")
sha256sums=('16225cdfa7658362627c711d29db71fc4cc4886f2390a47e8aa2d3aafafd0e37')

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
