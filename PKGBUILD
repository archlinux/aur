# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ed2k
_name=${pkgname#python-}
pkgver=0.0.2.1
pkgrel=2
epoch=
pkgdesc="Python ed2k hash module."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    python
    python-pycryptodome
    #AUR
    python-filewrap
    python-iterdir
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('84eacfdf605087806a57d56e21cbea08dbcc75410ad51e567cf6e510367b4f83')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
