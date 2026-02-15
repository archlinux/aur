# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-http-client-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="http.client request extension."
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
    python-property
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
sha256sums=('5f5f1ced7430452087a954fcdadf50ff0f5f8429510f1d09eb338e756238076b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
