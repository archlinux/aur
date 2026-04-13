# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-download
_name=${pkgname//-/_}
pkgver=0.0.4.1
pkgrel=1
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
sha256sums=('f60a4029f8e28ec0720a40dc39986f9afb01dda2c339f6c21c3a87ebc96f19a1')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
