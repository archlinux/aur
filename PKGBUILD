# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio
pkgname=python-${_name}
pkgver=5.16.1
pkgrel=2
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=('any')
url='https://github.com/gradio-app/gradio'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/${_name}@${pkgver}.tar.gz")
sha256sums=('52848de66cb1d2e6b00516b75b8b63ae633c47bcc0db8a7f9c01d43b20cdec6a')
depends=('python>=3.10' 'python-aiofiles' 'python-anyio' 'python-audioop-lts' 'python-fastapi' 'python-ffmpy' 'python-gradio-client' 'python-httpx' 'python-huggingface-hub' 'python-jinja' 'python-markupsafe' 'python-numpy' 'python-orjson' 'python-packaging' 'python-pandas' 'python-pillow' 'python-pydantic' 'python-python-multipart' 'python-pydub' 'python-pyyaml' 'python-ruff' 'python-safehttpx' 'python-semantic-version' 'python-starlette' 'python-tomlkit' 'python-typer' 'python-typing_extensions' 'python-urllib3' 'uvicorn')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme')
checkdepends=('ipython' 'python-altair' 'python-boto3' 'python-coverage' 'python-fastapi' 'python-gradio-pdf' 'python-matplotlib' 'python-httpx' 'python-huggingface-hub' 'python-hypothesis' 'python-polars' 'python-pydantic' 'python-email-validator' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-rerunfailures' 'python-ruff' 'python-respx' 'python-scikit-image' 'python-pytorch' 'python-tqdm' 'python-transformers' 'python-vega_datasets' 'python-diffusers')
optdepends=('python-authlib: oauth' 'python-itsdangerous: oauth')

build() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name}-${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
