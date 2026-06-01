# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-smolagents
_pkgname=smolagents
pkgver=1.26.0
pkgrel=1
pkgdesc="A barebones library for agents that write Python code to call tools or orchestrate other agents"
arch=('any')
url="https://github.com/huggingface/smolagents"
license=('Apache-2.0')
depends=(
    'python'
    'python-huggingface-hub'
    'python-requests'
    'python-rich'
    'python-jinja'
    'python-pillow'
    'python-dotenv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-openai: for OpenAI model support'
    'litellm: for LiteLLM model support'
    'python-transformers: for local Transformers model support'
    'python-accelerate: for local Transformers model support'
    'python-pytorch: for torch-based features'
    'python-torchvision: for torch-based features'
    'python-gradio: for Gradio UI support'
    'python-docker: for Docker code execution'
    'python-mcp: for MCP tool support'
    'python-boto3: for AWS Bedrock model support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/huggingface/smolagents/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1703dc9578c54ff4b8aaf3d2a80df24879c6fcc56e652ba50cba06924e04cdd')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import smolagents; print(smolagents.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
