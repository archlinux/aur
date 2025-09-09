# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jieba3
_name=${pkgname#python-}
pkgver=1.0.1
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
sha256sums=('13537aaf26a3c89758799a2cdfc4b840aed42a12b7bc3af4b00c8297015db4ac')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
