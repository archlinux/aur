# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-http-request
_name=${pkgname//-/_}
pkgver=0.1.6.3
pkgrel=1
epoch=
pkgdesc="Python http response utils."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-orjson
    python-yarl
    #AUR
    python-asynctools
    python-dicttools
    python-ensure
    python-filewrap
    python-http-response
    python-texttools
)
makedepends=(
    python-poetry
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('25c954861cd69cd81efe62ef45e836bbbff827d362abc9ab21d7b97ca412c4fd')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
