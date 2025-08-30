# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bitsandbytes
_name=${pkgname#python-}
pkgver=0.47.0
pkgrel=1
epoch=
pkgdesc="k-bit optimizers and matrix multiplication routines."
arch=('any')
url="https://github.com/bitsandbytes-foundation/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(

    gcc-libs
    glibc
    python

    python-numpy
    python-scipy
    python-pytorch
    python-triton
    python-typing_extensions
    # AUR

)
makedepends=(
    cmake
    cuda
    git
    python-scikit-build
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=$pkgver")
noextract=()
sha256sums=('b40be8d6997375e5dc441a467cb3a403d89401b3f4e533b6f9d903f4ff0d2fe8')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
