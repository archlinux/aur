# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urllib3-future-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="urllib3.future request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-yarl
    #AUR
    python-asynctools
    python-cookietools
    python-dicttools
    python-filewrap
    python-http-response
    python-http-request
    python-urllib3-future
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
sha256sums=('4a235dab9e53c3dbd7acc52b22ae5b57dceba4948171ba5e01ead52b5bf93245')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
