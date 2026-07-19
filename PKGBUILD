# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>
# Maintainer: enihcam <enihcam@archlinux.us>

_name=litellm
pkgname=python-$_name
pkgver=1.93.0
pkgrel=1
pkgdesc='Library to easily interface with LLM API providers.'
arch=('any')
url='https://github.com/BerriAI/litellm'
license=('MIT')
depends=('python' 'glibc' 'libgcc' 'python-fastuuid' 'python-httpx' 'python-openai' 'python-dotenv' 'python-tiktoken' 'python-importlib-metadata' 'python-tokenizers' 'python-click' 'python-jinja' 'python-aiohttp' 'python-pydantic' 'python-jsonschema')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel')
optdepends=('gunicorn: proxy' 'uvicorn: proxy' 'python-granian: proxy' 'python-uvloop: proxy' 'python-fastapi: proxy' 'python-starlette: proxy' 'python-backoff: proxy' 'python-pyyaml: proxy' 'python-rq: proxy' 'python-orjson: proxy' 'python-apscheduler: proxy' 'python-fastapi-sso: proxy' 'python-pyjwt: proxy' 'python-python-multipart: proxy' 'python-cryptography: proxy' 'python-pynacl: proxy' 'python-websockets: proxy' 'python-boto3: proxy' 'python-azure-identity: proxy' 'python-azure-storage-blob: proxy' 'python-mcp: proxy' 'python-litellm-proxy-extras: proxy' 'python-litellm-enterprise: proxy' 'python-restrictedpython: proxy' 'python-rich: proxy' 'python-polars: proxy' 'python-soundfile: proxy' 'python-pyroscope-io: proxy' 'python-pydantic-settings: proxy' 'python-expression: proxy'
            'python-rich: cli' 'python-pyyaml: cli' 'python-requests: cli'
            'python-prisma: extra_proxy' 'python-azure-identity: extra_proxy' 'python-azure-keyvault-secrets: extra_proxy' 'python-google-cloud-kms: extra_proxy' 'python-google-cloud-iam: extra_proxy' 'python-resend: extra_proxy' 'python-redisvl: extra_proxy' 'python-a2a-sdk: extra_proxy'
            'python-numpydoc: utils'
            'python-diskcache: caching'
            'python-semantic-router: semantic-router' 'python-aurelio-sdk: semantic-router'
            'python-mlflow: mlflow'
            'python-grpcio: grpc'
            'python-nvidia-riva-client: stt-nvidia-riva' 'python-soundfile: stt-nvidia-riva' 'python-audioread: stt-nvidia-riva' 'python-numpy: stt-nvidia-riva'
            'python-google-cloud-aiplatform: google'
            'python-google-cloud-aiplatform: proxy-runtime' 'python-google-genai: proxy-runtime' 'python-anthropic: proxy-runtime' 'python-google-auth: proxy-runtime' 'python-requests: proxy-runtime' 'python-grpcio: proxy-runtime' 'python-prometheus_client: proxy-runtime' 'python-langfuse: proxy-runtime' 'python-opentelemetry-api: proxy-runtime' 'python-opentelemetry-sdk: proxy-runtime' 'python-opentelemetry-exporter-otlp: proxy-runtime' 'python-opentelemetry-instrumentation-fastapi: proxy-runtime' 'python-ddtrace: proxy-runtime' 'python-sentry_sdk: proxy-runtime' 'python-mangum: proxy-runtime' 'python-azure-ai-contentsafety: proxy-runtime' 'python-azure-storage-file-datalake: proxy-runtime' 'python-pypdf: proxy-runtime' 'python-llm-sandbox: proxy-runtime' 'python-detect-secrets: proxy-runtime')
options=(!lto !strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('140bf215e264c71601bca9c06d2436c5451bb59e1e195ea23fc2d3d87b6929ec')


prepare() {
  cd "$srcdir"/$_name-$pkgver
  sed -i 's/maturin==[0-9.]*/maturin/g' pyproject.toml
}

build() {
  cd "$srcdir"/$_name-$pkgver
  PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1 python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
