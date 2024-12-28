# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpfile
_name=${pkgname//-/_}
pkgver=0.0.5
pkgrel=2
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
    python-poetry
    #AUR
    python-asynctools
    python-filewrap
    python-http-response
    python-urlopen
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('2181043a0bc306039efedb81a0bea44d4cc769b63e4f4baf945f79797da735af')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
