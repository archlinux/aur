# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-barcode
pkgver=0.15.1
pkgrel=1
pkgdesc="Create standard barcodes with Python. No external modules needed."
arch=('any')
license=('MIT')
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
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
