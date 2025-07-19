# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115dav
_name=${pkgname#python-}
pkgver=0.0.10.2.1
pkgrel=1
epoch=
pkgdesc="115 网盘 WebDAV 和 302 直链程序."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    uvicorn
    python
    python-orjson
    python-pyaml
    #AUR
    python-a2wsgi
    python-blacksheep
    python-cachedict
    python-dictattr
    python-encode-uri
    python-httpagentparser
    python-p115client
    python-path-predicate
    python-posixpatht
    python-pysubs2
    python-wsgidav
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
sha256sums=('512cf489ec56e287ff44fc05f19a25d579402d150324ea62237686026935de0b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
