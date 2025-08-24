# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-asks-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.2.2
pkgrel=1
epoch=
pkgdesc="asks request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-h11
    python-yarl
    #AUR
    python-asks
    python-argtools
    python-asynctools
    python-cookietools
    python-dicttools
    python-ensure
    python-filewrap
    python-http-response
    python-http-request
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
sha256sums=('9d8c6d571a87d81ce0890f73f4b419b5059ea5718e8be3bb820cf06d4f36bb39')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
