# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-audiblez
_name=${pkgname#python-}
pkgver=0.4.9
pkgrel=1
epoch=
pkgdesc="Generate audiobooks from e-books (epub to wav/m4b)"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-beautifulsoup4
    python-numpy
    python-soundfile
    python-pillow
    python-wxpython
    python-tabulate
    # AUR
    python-ebooklib
    python-kokoro
    python-spacy
    python-phonemizer
    python-pick
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
    "python-pytorch-cuda: Tensors and Dynamic neural networks in Python with strong GPU acceleration (with CUDA)"

)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('c8e054ffcdc22606908f876b6c2f9c87bf07bf7191668f45d56df8d25659cb65')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
