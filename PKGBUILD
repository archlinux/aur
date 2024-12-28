# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dupan
_name=${pkgname//-/_}
pkgver=0.0.1.3.8
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
sha256sums=('a9790fbdac2182a4c834eb663019089fc4995b5b1a109cd65cd8c2a265edfd90')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
