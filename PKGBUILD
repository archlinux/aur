# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-http-request
_name=${pkgname//-/_}
pkgver=0.1.7.2
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
sha256sums=('2e31173713a1c911565495370c787dac6dda744ff8e71a9fe244dfad70a8135a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
