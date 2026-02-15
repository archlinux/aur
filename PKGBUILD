# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urlopen
_name=${pkgname//-/_}
pkgver=0.1.7.1
pkgrel=1
epoch=
pkgdesc="Python urlopen wrapper."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-yarl
    #AUR
    python-argtools
    python-cookietools
    python-dicttools
    python-filewrap
    python-http-client-request
    python-http-response
    python-http-request
    python-undefined
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
sha256sums=('38891516fa4b79d3f005c814a1d9d947e0b8a1c0e49bfe36d8a4f0e59248aabb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
