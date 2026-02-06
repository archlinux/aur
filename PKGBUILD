# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=dspy
pkgname=python-$_name
pkgver=3.1.3
pkgrel=1
pkgdesc="The framework for programming (not prompting) language models"
arch=(any)
url=https://github.com/stanfordnlp/dspy
license=(MIT)
depends=(
    litellm
    python-anyio
    python-asyncer
    python-cachetools
    python-cloudpickle
    python-diskcache
#     python-gepa  # TODO: some dependencies are broken in AUR
    python-json_repair
    python-numpy
    python-openai
    python-optuna
    python-orjson
    python-pydantic
    python-regex
    python-requests
    python-tenacity
    python-tqdm
    python-xxhash
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
b2sums=('ff7facdae581303ed7b0de37a67bfbdf674eaa8137a8284c6d7cc355af0b5de32093e143d13b4536c390a8750bf079461d96e71b770e0a354f22ee10ff561968')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
