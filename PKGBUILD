# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spacy-curated-transformers
_name=${pkgname#python-}
pkgver=2.1.2
pkgrel=1
epoch=
pkgdesc="Curated transformer models for spaCy pipelines"
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-fsspec
    python-numpy
    python-pytorch
    python-pytest
    python-typer
    # AUR
    python-confection
    python-curated-tokenizers
    python-curated-transformers
    #     python-fugashi
    python-huggingface-hub
    python-spacy
    python-srsly
    python-thinc
    python-transformers
    python-wasabi
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-pytest-mypy
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('b39ad476a8cb23cc6c566b55b14808f34593c8b7849b26cc4718b71e106e9941')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
