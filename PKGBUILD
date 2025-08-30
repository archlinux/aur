# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-curated-transformers
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="A PyTorch library of transformer models and components"
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-huggingface-hub
    python-pytorch
    # AUR
    python-catalogue
    python-curated-tokenizers
    python-tokenizers
    python-pytest
    python-pytest-mypy
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
sha256sums=('3348e639d9247bf222bcd90cefded05b37c5dc0e798b0af6957e37a4aafd0f1d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
