# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-clouddrive-proxy
_name=${pkgname//-/_}
pkgver=0.0.1
pkgrel=3
epoch=
pkgdesc="Python clouddrive reverse proxy."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-protobuf
    uvicorn
    #AUR
    python-blacksheep
    python-clouddrive
    python-reverse-proxy
    python-sqlitetools
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
optdepends=(
    'clouddrive: CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage'
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('74a5aab20aa5edb7cc0eed27f04ee9c9c43ba57a830d8644d458944d6bd7be19')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
