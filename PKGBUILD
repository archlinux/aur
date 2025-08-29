# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dlinfo
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Python wrapper for libc's dlinfo and dyld_find on Mac"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-setuptools-scm
)
checkdepends=(
    python-pytest
)
optdepends=(
    "python-pytorch-cuda: Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CUDA)"

)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('88a2bc04f51d01bc604cdc9eb1c3cc0bde89057532ca6a3e71a41f6235433e17')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
