# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpfile
_name=${pkgname//-/_}
pkgver=0.0.5.2
pkgrel=1
epoch=
pkgdesc="Python httpfile."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-poetry
    #AUR
    python-asynctools
    python-filewrap
    python-http-response
    python-urlopen
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('10a9201ae62e9927f3c6109192499093aef97b36ce13bd8253fc2b8545aedf4f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
