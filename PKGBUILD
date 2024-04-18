# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qq-botpy
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=0
epoch=
pkgdesc="qq-botpy 是基于机器人开放平台API 实现的机器人框架，目的提供一个易使用、开发效率高的开发框架。"
arch=('any')
url="https://pypi.org/project/qq-botpy"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
_py_deps=(
    apscheduler
    'aiohttp>=3.7.4'
    pyyaml)
depends=(
    pre-commit
    python
    "${_py_deps[@]/#/python-}")
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
# checkdepends=(python-pytest)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
noextract=()
sha256sums=('442172a0557a9b43d2777d1c5e072090a9d1a54d588d1c5da8d3efc014f4887f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
