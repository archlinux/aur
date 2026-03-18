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
  'python-partial-json-parser'
  'python-pydantic'
  'python-requests'
  'python-pytorch-cuda'
  'python-safetensors'
  'python-torchvision'
  'python-transformers'
  'python-triton'
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
  # runtime_common (serving stack)
  'python-anthropic: Anthropic API backend'
  'python-compressed-tensors: Compressed tensor support'
  'python-datasets: Dataset loading'
  'python-einops: Tensor operations'
  'python-fastapi: API server'
  'python-gguf: GGUF model format support'
  'python-grpcio: gRPC support'
  'python-huggingface-hub: Model hub access'
  'python-modelscope: ModelScope model hub'
  'python-msgspec: Fast serialization'
  'ninja: Build system for JIT compilation'
  'python-openai: OpenAI-compatible API'
  'python-orjson: Fast JSON serialization'
  'python-outlines: Structured generation'
  'python-packaging: Version utilities'
  'python-pillow: Image processing'
  'python-psutil: Process monitoring'
  'python-python-multipart: Multipart form parsing'
  'python-pyzmq: ZeroMQ messaging'
  'python-scipy: Scientific computing'
  'python-sentencepiece: Tokenization'
  'python-soundfile: Audio file support'
  'python-tiktoken: OpenAI tokenizer'
  'python-timm: Vision model library'
  'uvicorn: ASGI server'
  'python-uvloop: Fast event loop'
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
