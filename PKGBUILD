# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urlopen
_name=${pkgname//-/_}
pkgver=0.1.0
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
sha256sums=('ad5aeb170c597ae97aa5e57bac3603e01b0e0d504df109614744986583835477')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
