# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jieba3
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=3
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
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('eac23c0ec601bbaa40b4a2c050ac3589d45c8de45c7c23e6dae688518836a3df')

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
