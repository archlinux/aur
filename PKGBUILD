# Mantenido por: tac
pkgname=mbed-os-tools
pkgver=0.0.15
pkgrel=15
pkgdesc="Herramientas para compilar proyectos de Mbed OS"
url="https://github.com/ARMmbed/${pkgname}"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pyserial' 'python-requests' 'python-intelhex' 'python-prettytable' 'python-fasteners' 'python-appdirs' 'python-junit-xml' 'python-lockfile' 'python-six' 'python-colorama')
makedepends=('python-build' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60e77755e43d9dc0612ecbbb02ff3321dd79993a664a22c3ad2405f6de61c7e2')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer dist/*.whl --destdir="$pkgdir"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

