# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-marine
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="Marine: Multi-task learning based on Japanese accent estimatio"
arch=('any')
url="https://pypi.org/project/${_name}"
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
    python-build
    python-installer
    python-wheel
    # python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('d5d7990364be80653294db04be7e7410d922aec9bafc375e0e9354cf94a00bee')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
