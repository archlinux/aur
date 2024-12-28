# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-download
_name=${pkgname//-/_}
pkgver=0.0.3.1
pkgrel=2
epoch=
pkgdesc="Python for download."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-asynctools
    python-concurrenttools
    python-filewrap
    python-http-response
    python-urlopen
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
sha256sums=('9f86cced9ac48af00f988e07e4638f78815f3d3b7ff3a646061a53753fb43c85')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
