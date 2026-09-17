# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-marine
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=4
epoch=
pkgdesc="Marine: Multi-task learning based on Japanese accent estimatio"
arch=('any')
url="https://github.com/6gsn/marine"
license=(Apache-2.0)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-joblib
    python-matplotlib
    python-numpy
    python-tqdm
    python-omegaconf
    python-pytest
    python-pytorch
    python-yaml
    python-setuptools
    # AUR
    python-hydra-core
    python-scikit-base
    python-torchmetrics
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('15191bcad622732114c01f5d41f1ad334b7466a28056fe8ff545f7b4aaabd791')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
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
