# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.89.0
pkgrel=1
pkgdesc='Library to easily interface with LLM API providers.'
arch=(any)
url='https://github.com/BerriAI/litellm'
license=('MIT')
depends=('python' 'python-fastuuid' 'python-httpx' 'python-openai' 'python-dotenv' 'python-tiktoken' 'python-importlib-metadata' 'python-tokenizers' 'python-click' 'python-jinja' 'python-aiohttp' 'python-pydantic' 'python-jsonschema')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
optdepends=('gunicorn: proxy'
            'uvicorn: proxy'
            'python-uvloop: proxy'
            'python-fastapi: proxy'
            'python-backoff: proxy'
            'python-pyyaml: proxy'
            'python-rq: proxy'
            'python-orjson: proxy'
            'python-apscheduler: proxy'
            'python-fastapi-sso: proxy'
            'python-pyjwt: proxy'
            'python-python-multipart: proxy'
            'python-cryptography: proxy'
            'python-pynacl: proxy'
            'python-websockets: proxy'
            'python-boto3: proxy'
            'python-azure-identity: proxy'
            'python-azure-storage-blob: proxy'
            'python-mcp: proxy'
            'python-litellm-proxy-extras: proxy'
            'python-litellm-enterprise: proxy'
            'python-restrictedpython: proxy'
            'python-rich: proxy'
            'python-polars: proxy'
            'python-soundfile: proxy'
            'python-pyroscope-io: proxy'

            'python-prisma: extra_proxy'
            'python-azure-identity: extra_proxy'
            'python-azure-keyvault-secrets: extra_proxy'
            'python-google-cloud-kms: extra_proxy'
            'python-google-cloud-iam: extra_proxy'
            'python-resend: extra_proxy'
            'python-redisvl: extra_proxy'
            'python-a2a-sdk: extra_proxy'

            'python-numpydoc: utils'

            'python-diskcache: caching'

            'python-semantic-router: semantic-router'
            'python-aurelio-sdk: semantic-router'

            'python-mlflow: mlflow'

            'python-grpcio: grpc'

            'python-google-cloud-aiplatform: google'

            'python-google-cloud-aiplatform: proxy-runtime'
            'python-google-genai: proxy-runtime'
            'python-anthropic: proxy-runtime'
            'python-google-auth: proxy-runtime'
            'python-requests: proxy-runtime'
            'python-grpcio: proxy-runtime'
            'python-prometheus-client: proxy-runtime'
            'python-langfuse: proxy-runtime'
            'python-opentelemetry-api: proxy-runtime'
            'python-opentelemetry-sdk: proxy-runtime'
            'python-opentelemetry-exporter-otlp: proxy-runtime'
            'python-ddtrace: proxy-runtime'
            'python-sentry_sdk: proxy-runtime'
            'python-mangum: proxy-runtime'
            'python-azure-ai-contentsafety: proxy-runtime'
            'python-azure-storage-file-datalake: proxy-runtime'
            'python-pypdf: proxy-runtime'
            'python-llm-sandbox: proxy-runtime'
            'python-detect-secrets: proxy-runtime')
provides=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('eb1910a23497044b4375a0500c65f4c60d291a575d7b679c7566a5df9b9a5fcb')


prepare() {
  cd "${srcdir}"/$pkgname-$pkgver/
  sed -i 's/uv_build==[0-9.]*/uv_build/g' pyproject.toml
}


build() {
  cd "${srcdir}"/$pkgname-$pkgver/
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
