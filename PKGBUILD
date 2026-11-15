# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jieba3
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="jieba 3 Chinese Word Segmentation: Building the Best Modern Python 3 Chinese Word Segmentation Component"
arch=('any')
url="https://github.com/yansh97/jieba3"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-pydantic
)
makedepends=(
    git
    python-flit-core
    python-uv-build
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('272ed7770e0f065f0b544cdfd5f8836f48b02989c3df2bc9fd02bd49dd71d3fe')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's|flit_core >=3.2,<4|flit_core >=3.2,<5|' pyproject.toml
}
build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
