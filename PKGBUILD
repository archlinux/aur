# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=dspy
pkgname=python-$_name
pkgver=3.0.4
pkgrel=1
pkgdesc="The framework for programming (not prompting) language models"
arch=(any)
url=https://github.com/stanfordnlp/dspy
license=(MIT)
depends=(
    litellm
    python-anyio
    python-asyncer
    python-backoff
    python-cachetools
    python-cloudpickle
    python-diskcache
    # python-gepa
    python-joblib
    python-json_repair
    python-magicattr
    python-importlib-metadata
    python-openai
    python-optuna
    python-orjson
    python-pydantic
    python-regex
    python-requests
    python-tenacity
    python-tqdm
    python-xxhash
    python-yaml
)
optdepends=(
    "deno: python interpreter"
    "python-anthropic: support for Anthropic"
    "python-chromadb: support for Chroma"
    "python-fastembed: required to use Qdrant"
    "python-lancedb: support for LanceDB"
    "python-langchain: support composability of multiple LLMs"
    "python-marqo: support for Marqo"
    "python-mcp: support Model Context Protocol"
    "python-pillow: support for signatures"
    "python-pinecone-client: support for Pinecone"
    "python-pyepsilla: support for EpsillaDB"
    "python-qdrant-client: support for Qdrant"
    "python-redis: support for FalkorDB"
    "python-rich: synthesizer submodule"
    "python-weaviate-client: support for Weaviate"
    "python-pymilvus: support for Milvus"
    "python-boto3: support for AWS"
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
)
source=($_name::git+https://github.com/stanfordnlp/dspy.git#tag=$pkgver)
b2sums=('47e91d2773e9080f6ebbb437739f708a4e2304570c14532ad83dea730451fae3aa2f1a3c292dc392bc9fa7d22f099bf6dd50a2abb2ae79e2e29aef68d66a76b1')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
