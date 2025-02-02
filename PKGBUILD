# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=dspy
pkgname=python-$_name
pkgver=2.6.0
pkgrel=3
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
    python-jinja
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
b2sums=('e5efc5b9a2dd1f85f1c54eec3b6b67d0be3ddcfb7e72a7e04a4f3c959e2614741125e4e33ce232c6a048a37bdb19540fd292763571387f5f56ae68cddd17a56d')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
