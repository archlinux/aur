# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urllib3-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.5.1
pkgrel=1
epoch=
pkgdesc="urllib3 request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-urllib3
    python-yarl
    #AUR
    python-argtools
    python-cookietools
    python-dicttools
    python-filewrap
    python-http-response
    python-http-request
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
sha256sums=('fa7e40ca46b24241f720f4f89f072878ebf1994a90f4c8e185779ac0fc0b150e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
