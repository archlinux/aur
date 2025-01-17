# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dhash"
_name=${pkgname#python-}
pkgdesc="Calculate the difference hash (perceptual hash) for an image"
url="https://github.com/Jetsetter/dhash"

pkgver=1.4
pkgrel=5

arch=("any")
license=("MIT")

makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
depends=(
    "python"
    "python-pillow"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('b2a86fb8d7acb46dc3b6d37ba3d0de78c0cd0fdb387d3b6a948ced747ea07e8152e91cb46d7c6e8e305be6d6c7b96bd668c218069ef9d1e84afa96bb2b851fa1')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
