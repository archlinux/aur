# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kokoro
_name=${pkgname#python-}
pkgver=0.9.4
pkgrel=1
epoch=
pkgdesc="TTS An inference library for Kokoro-82M"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-huggingface-hub
    python-loguru
    python-numpy
    python-pytorch
    python-transformers
    # AUR
    python-misaki-en
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('fbf633262797f8cf46fdac3315cf9cade67dc8b762c0feccf334892772fb9ac4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
