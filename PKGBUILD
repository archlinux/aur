# Mantenido por: tac
pkgname=mbed-cli
pkgver=1.10.4
pkgrel=43
pkgdesc="Mbed Command Line Interface"
url="https://github.com/ARMmbed/${pkgname}"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pyserial' 'mbed-os-tools')
makedepends=('python-build' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5ffeca471bc853d247416a341d715b7b8f4f0cccf44ca131e667efe999c194a347b7b61e57450555d412e25dc6138c02e02fcdd4fbda260da495544580c34470')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer dist/*.whl --destdir="$pkgdir"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
