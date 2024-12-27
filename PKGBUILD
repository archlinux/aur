# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-concurrenttools
_name=${pkgname//-/_}
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="Python concurrent tools."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-argtools
    python-asynctools
    python-decotools
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
sha256sums=('c042d5aabac1142bda7423eae1e101202119d0248f3f3febf98b8aa097687509')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
