# Maintainer: Raphael <raphael.girard.iut@gmail.com>
pkgname=something-x
pkgver=1.8.2
pkgrel=1
pkgdesc="GTK4 device manager for Nothing earbuds on Linux"
arch=('any')
url="https://github.com/SoaOaoS/nothingonmarchy"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('libpulse: volume control via pactl')
source=("https://files.pythonhosted.org/packages/source/s/something-x/something_x-${pkgver}.tar.gz")
sha256sums=('444efd1d909a4e17eab5ea3347951e3e9e6377386241b29aaaf8b6f4b1e267ad')

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
