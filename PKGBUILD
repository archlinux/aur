# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ray
pkgver=2.9.0
pkgrel=2
pkgdesc='A fast and simple framework for building and running distributed
applications.'
arch=('x86_64')
url='https://ray.io'
license=('Apache-2.0')
depends=(psmisc python python-attrs python-click python-filelock python-grpcio
         python-jsonschema python-msgpack python-numpy python-protobuf
         python-pyaml python-redis)
optdepends=(
            'python-pandas: for ray[data, tune, rllib]'
            'python-pyarrow: for ray[data, tune, rllib]'
            'python-fsspec: for ray[data, tune, rllib]'
            'python-aiohttp: for ray[default, serve]'
            'python-aiohttps-cors: for ray[default, serve]'
            'python-colorful: for ray[default, serve]'
            'py-spy: for ray[default, serve]'
            'python-requests: for ray[default, serve, tune]'
            'python-opencensus: for ray[default, serve]'
            'python-prometheus_client: for ray[default, serve]'
            'python-smart-open: for ray[default, serve]'
            'python-virtualenv: for ray[default, serve]'
            'uvicorn: for ray[serve]'
            'python-starlette: for ray[serve]'
            'python-fastapi: for ray[serve]'
            'python-aiowrlock: for ray[serve]'
            'python-watchfiles: for ray[serve]'
            'python-tensorboardx: for ray[tune, rllib]'
            'python-opentelemetry-api: for ray[observability]'
            'python-opentelemetry-sdk: for ray[observability]'
            'python-opentelemetry-exporter-otlp: for ray[observability]'
            'python-dm-tree: for ray[rllib]'
            'python-gymnasium: for ray[rllib]'
            'python-lz4: for ray[rllib]'
            'python-scikit-image: for ray[rllib]'
            'python-pyaml: for ray[rllib]'
            'python-scipy: for ray[rllib]'
            'python-typer: for ray[rllib]'
            'python-rich: for ray[rllib]'
           )
makedepends=(python python-build python-installer python-wheel python-setuptools
             python-pip cython bazel)
_pkgname=ray
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ray-project/ray/archive/${_pkgname}-$pkgver.tar.gz")

sha256sums=('bebe4413dd1a856cd854308d76d14fb412727b6228bfbdea5f3b5a45ef3f5acc')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # https://aur.archlinux.org/packages/py-spy#comment-781521
  sed -i "/py-spy/d" python/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
