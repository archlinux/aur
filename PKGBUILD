# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpfile
_name=${pkgname//-/_}
pkgver=0.0.5.4
pkgrel=1
epoch=
pkgdesc="Python httpfile."
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
    python-filewrap
    python-http-response
    python-property
    python-urlopen
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
sha256sums=('37fa7cb57609f77993267978cfb4556135aaec156e5f39071cd4a1fb7ca6f319')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
