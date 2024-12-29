# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-clouddrive
_name=${pkgname#python-}
pkgver=0.0.12.7.1
pkgrel=1
epoch=
pkgdesc="Python wrapper for CloudDrive."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-cachetools
    python-dateutil
    python-pyfuse3
    python-grpcio
    python-grpcio-tools
    python-orjson
    python-psutil
    python-protobuf
    python-ujson
    python-urllib3
    python-yarl
    #AUR
    python-argtools
    python-concurrenttools
    python-download
    python-filewrap
    python-httpfile
    python-http-response
    python-http-request
    python-glob-pattern
    python-grpclib
    python-path-ignore-pattern
    python-urlopen
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
sha256sums=('4ccf1534e9666b96ff3a7204a9b94967cbe48cc1bece4e03108fd9ab286f8b2b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
