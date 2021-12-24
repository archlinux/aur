# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=1.9.1
pkgrel=1
pkgdesc='A fast and simple framework for building and running distributed
applications.'
arch=('x86_64')
url='https://ray.io'
license=('Apache-2.0')
depends=(psmisc python python-aiohttp python-aiohttp-cors python-aioredis
         python-click python-colorama python-filelock python-gpustat
         python-grpcio python-jsonschema python-msgpack python-numpy
         python-protobuf py-spy python-pyaml python-requests python-redis
         python-opencensus python-prometheus_client)
optdepends=(
            'python-colorful: for ray[default]'
            'uvicorn: for ray[serve] module'
            'python-flask: for ray[serve] module'
            'python-pydantic: for ray[serve] module'
            'python-starlette: for ray[serve] module'
            'python-fastapi: for ray[serve] module'
            'python-pandas: for ray[tune] and ray[rllib] module'
            'python-tabulate: for ray[tune] and ray[rllib] module'
            'python-tensorboardx: for ray[tune] and ray[rllib] module'
            'python-kubernetes: for ray[k8s]'
            'python-atari-py: for ray[rllib] module'
            'python-dm-tree: for ray[rllib] module'
            'python-gym: for ray[rllib] module'
            'python-lz4: for ray[rllib] module'
            'opencv: for ray[rllib] module'
            'python-pyaml: for ray[rllib] module'
            'python-scipy: for ray[rllib] module'
           )
makedepends=(python python-setuptools python-wheel python-pip cython bazel)
_pkgname=ray
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ray-project/ray/archive/${_pkgname}-$pkgver.tar.gz")
sha256sums=('394e34e6a1614ece96a3b2e9dd5bcf77fcfc246aaf3cce8c361f2b3ffff1242c')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # https://aur.archlinux.org/packages/py-spy#comment-781521
  sed -i "/py-spy/d" python/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
