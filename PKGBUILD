# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115servedb
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="115 网盘基于 p115updatedb 导出数据库的挂载服务"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-orjson
    python-urllib3
    python-yaml
    uvicorn
    #AUR
    python-a2wsgi
    python-blacksheep
    python-encode-uri
    python-fusepy
    python-httpagentparser
    python-httpfile
    python-p115client
    python-p115updatedb
    python-path-predicate
    python-property
    python-posixpatht
    python-pysubs2
    python-wsgidav
)
makedepends=(
    python-poetry
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e379e054e27d813224bdd832ca9fa9b91089567870296f8ef56d788f39e0f84f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
