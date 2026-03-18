# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=sglang
pkgver=0.5.9
pkgrel=1
pkgdesc='A fast serving framework for large language models and vision language models'
arch=('any')
url='https://github.com/sgl-project/sglang'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-aiohttp'
  'python-numpy'
  'python-pybase64'
  'python-pydantic'
  'python-requests'
  'python-setproctitle'
  'python-tqdm'
  'ipython'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
optdepends=(
  'python-pytorch: Model serving runtime'
  'python-transformers: Model loading and tokenization'
  'python-fastapi: API server'
  'python-uvicorn: ASGI server for FastAPI'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5905242df108f4b6be1784192e7a9d0504e6251872d497a61cfc1fac2410bbad')

build() {
  cd "${pkgname}-${pkgver}/python"
  cp pyproject_other.toml pyproject.toml
  rm -rf build dist *.egg-info
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
