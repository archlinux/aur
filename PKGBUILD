# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-ai-dynamo
pkgver=1.3.0
pkgrel=1
_commit=5b4bc1dd70965017a737c71b19db5a0aeaa88727
pkgdesc='NVIDIA Dynamo: datacenter-scale distributed inference serving framework (Python)'
arch=('any')
url='https://github.com/ai-dynamo/dynamo'
license=('Apache-2.0')
depends=(
  'python'
  'python-ai-dynamo-runtime'
  'python-aiohttp'
  'python-transformers'
  'python-kubernetes'
  'python-prometheus_client'
  'python-msgspec'
  'python-pyzmq'
)
optdepends=(
  'python-nixl: NIXL data-transfer connector (dynamo.nixl_connect, multimodal KV transfer)'
  'python-pmdarima: load forecasting for the SLA planner (dynamo.planner)'
  'python-uvloop: faster asyncio event loop used by the inference backends'
  'python-tensorrt-llm: TensorRT-LLM inference backend (dynamo.trtllm)'
  'python-vllm: vLLM inference backend (dynamo.vllm)'
  'python-sglang: SGLang inference backend (dynamo.sglang)'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'git')
source=("git+https://github.com/ai-dynamo/dynamo.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() { echo "$pkgver"; }

build() {
  cd dynamo
  python -m build --wheel --no-isolation
}

package() {
  cd dynamo
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
