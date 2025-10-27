# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpcore-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.6.2
pkgrel=1
epoch=
pkgdesc="httpcore request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpcore
    python-yarl
    #AUR
    python-argtools
    python-asynctools
    python-cookietools
    python-dicttools
    python-filewrap
    python-http-response
    python-http-request
    python-undefined
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('071bed7fc8de5010103b9f5258f2feb7026c59d1700cd2d7095a1b2bcf5b0ece')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
