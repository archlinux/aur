# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
_base=ray
pkgname=python-${_base}
pkgver=2.36.1
pkgrel=1
pkgdesc="A fast and simple framework for building and running distributed
applications"
arch=(x86_64)
url="https://github.com/${_base}-project/${_base}"
license=(Apache-2.0)
depends=(psmisc python-click python-filelock python-jsonschema python-msgpack python-packaging
  python-protobuf python-pyaml python-aiosignal python-frozenlist python-requests)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython bazel python-pip)
optdepends=('python-pandas: for ray[data, tune, rllib]'
  'python-fsspec: for ray[data, tune, rllib]'
  'python-aiohttp: for ray[default, serve]'
  'python-aiohttps-cors: for ray[default, serve]'
  'python-colorful: for ray[default, serve]'
  'py-spy: for ray[default, serve]'
  'python-opencensus: for ray[default, serve]'
  'python-prometheus_client: for ray[default, serve]'
  'python-smart-open: for ray[default, serve]'
  'python-virtualenv: for ray[default, serve]'
  'uvicorn: for ray[serve]'
  'python-starlette: for ray[serve]'
  'python-fastapi: for ray[serve]'
  'python-tensorboardx: for ray[tune, rllib]'
  'python-opentelemetry-api: for ray[observability]'
  'python-opentelemetry-sdk: for ray[observability]'
  'python-opentelemetry-exporter-otlp: for ray[observability]'
  'python-dm-tree: for ray[rllib]'
  'python-gymnasium: for ray[rllib]'
  'python-lz4: for ray[rllib]'
  'python-scikit-image: for ray[rllib]'
  'python-scipy: for ray[rllib]'
  'python-typer: for ray[rllib]'
  'python-rich: for ray[rllib]'
)
conflicts=(mesa-demos)
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('01156612eb4afb02744bdb67f7a3f5fa169a9d5ce22e56d51d6830997c52bb38658ff8f6459ec2b396c3ca4b1fbb97bb06bfd7f79caf1c96763855fcc91bacc5')

# prepare() {
#   sed -i '/    runtime_env_agent_pip_packages/,+11 s/^/#/' ${_base}-${_base}-${pkgver}/python/setup.py
# }

build() {
  cd ${_base}-${_base}-${pkgver}/python
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  SKIP_THIRDPARTY_INSTALL=1 python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
