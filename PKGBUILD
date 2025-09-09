# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jieba3
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="jieba 3 Chinese Word Segmentation: Building the Best Modern Python 3 Chinese Word Segmentation Component"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-pydantic
)
makedepends=(
    python-flit-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('80054b147115ac6a09f50d54d68abcf55f2cb8d435ab71128da40effd0f4e2cb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
