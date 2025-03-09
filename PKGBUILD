# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-emby-proxy
_name=${pkgname//-/_}
pkgver=0.0.3
pkgrel=2
epoch=
pkgdesc="Python emby reverse proxy."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-yaml
    python-yarl
    #AUR
    python-blacksheep
    python-reverse-proxy
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
optdepends=(
    'emby-theater: Bring together your videos, music, photos, and live television'
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e617b99f8e1452471fe097a64c6e3f902b1f239fde6cd8e329364eff3bf269ef')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
