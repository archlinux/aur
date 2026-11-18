# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=fla2anim
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert XFL-based Flash projects to Pencil2D, Synfig, SWF and image sequences"
arch=('any')
url="https://github.com/kuznix-code/fla2anim"
license=('MIT')

depends=(
    'python'
    'python-pillow'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)

checkdepends=(
    'python-pytest'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kuznix-code/fla2anim/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('4e75c0ef0362b1fb62c63d284ba6dc1ff8c543f8c9f2c936ea5fe2fa18f2bd0b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m pytest -q
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
