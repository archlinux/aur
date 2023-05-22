# Maintainer: Jan-Niklas Burfeind <eq3bt-aur@aiyionpri.me>
# Previous maintainer: Christian Mauderer <oss@c-mauderer.de>

pkgname='python-eq3bt'
pkgver='0.2'
pkgrel=1
pkgdesc='Python library and command-line tool for EQ3 Smart Bluetooth thermostats.'
arch=('any')
url='https://github.com/rytilahti/python-eq3bt'
license=('MIT')
depends=('python' 'python-click' 'python-construct' 'python-bleak')
checkdepends=('python-pytest')
optdepends=('python-gattlib' 'python-bluepy')
makedepends=('python-installer' 'python-build' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d3813d35bc671e6f14338baf1bee824dec9be4b44df94f5cd931580b46900a8ae3e49fe05de72b98f246069889569431dc2e862f2afdcf26353298e2af1dda68')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m pytest eq3bt/tests
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" "dist/python_eq3bt-${pkgver}-py3-none-${arch}.whl"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
