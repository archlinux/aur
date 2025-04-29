# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=dspy
pkgname=python-$_name
pkgver=2.6.21
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
    python-datasets
    python-diskcache
    python-joblib
    python-json_repair
    python-magicattr
    python-importlib-metadata
    python-openai
    python-optuna
    python-pandas
    python-pydantic
    python-regex
    python-requests
    python-tenacity
    python-tqdm
    python-ujson
    python-yaml
)
optdepends=(
    "deno: python interpreter"
    "python-anthropic: support for Anthropic"
    "python-chromadb: support for Chroma"
    "python-fastembed: required to use Qdrant"
    "python-lancedb: support for LanceDB"
    "python-marqo: support for Marqo"
    "python-qdrant-client: support for Qdrant"
    "python-pillow: support for signatures"
    "python-pinecone-client: support for Pinecone"
    "python-pyepsilla: support for EpsillaDB"
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
    python-wheel
)
source=($_name::git+https://github.com/stanfordnlp/dspy.git#tag=$pkgver)
b2sums=('1bf3adf07c9c9fc30e7b50c1b21d3aee99251bec718d8a88dfdb00c797497baf7efdb00c4461865ffdd0e17e40f42f12ca92af4b89e2aa18f94ea0b5fd225e45')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
