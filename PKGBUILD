# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urlopen
_name=${pkgname//-/_}
pkgver=0.0.9
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
    python-brotli
    python-zstandard
    #AUR
    python-argtools
    python-filewrap
    python-http-response

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
sha256sums=('c85d011bae59feb562783c9624e932625c9b9d81582a9e44434c2519efe50498')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
