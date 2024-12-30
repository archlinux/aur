# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-emby-proxy
_name=${pkgname//-/_}
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Python emby reverse proxy."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-yaml
    python-yarl
    #AUR
    python-blacksheep
    python-reverse-proxy
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
sha256sums=('51e2285e2a4438fcf404cfa6faf26ca5d6c1b9c3e39501b892ca7bda5a863fdb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
