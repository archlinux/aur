# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-barcode
pkgver=0.16.1
pkgrel=2
pkgdesc="Create standard barcodes with Python. No external modules needed."
arch=(any)
license=(MIT)
conflicts=()
provides=('python-barcode')
url="https://github.com/WhyNotHugo/python-barcode"
depends=('python')
optdepends=('python-pillow: generate images')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
    'python-setuptools-scm'
    )
source=(
        "${pkgname}-${pkgver}::git+https://github.com/WhyNotHugo/${pkgname}.git#tag=v${pkgver}"
    )
sha512sums=('6f16b6af9f6b6c0a9f53551e710e6e93076ed50b7d8da922286728a9b16e36e87532351e7413602c53e41ecaea5a2c2a1f66d11abc99f23dc7aa0744d1a6c18a')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
