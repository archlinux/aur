# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_name=dspy
pkgname=python-$_name
pkgver=2.6.17
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
b2sums=('6acdb0162c4eecd0f11be3c1c4430bb323648092eff4afb14a13b4161ddbccb81652c326da8782164605b0c5ed602cba41affd8f41d6c0d50663a2d0c06b0644')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
