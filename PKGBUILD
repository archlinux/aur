# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dupan
_name=${pkgname//-/_}
pkgver=0.0.2.2
pkgrel=1
epoch=
pkgdesc="Python wrapper for baidu webdisk <https://pan.baidu.com>."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-lxml
    python-qrcode
    python-requests
    #AUR
    python-ddddocr
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('00b8eec3acc4207e939d8342a46685a8bb16fc3485b161f9d7c9c2ecebb90a45')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
