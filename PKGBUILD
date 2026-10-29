# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="litellm-bin"
_name="${pkgname%-bin}"
_py=cp310
pkgver=1.106.6
pkgrel=1
pkgdesc="Library to easily interface with LLM API providers (prebuilt wheel)"
arch=("x86_64" "aarch64")
url="https://github.com/BerriAI/litellm"
license=("MIT")
# same as litellm
depends=('python'
         'python-fastuuid'
         'python-filelock'
         'python-httpx'
         'python-h2'
         'python-openai'
         'python-dotenv'
         'python-pyyaml'
         'python-packaging'
         'python-importlib-metadata'
         'python-tiktoken'
         'python-tokenizers'
         'python-huggingface-hub'
         'python-click'
         'python-jinja'
         'python-aiohttp'
         'python-pydantic'
         'python-pydantic-settings'
         'python-jsonschema'
         'python-boto3'
         'python-certifi'
         'python-typing_extensions'
         'glibc'
         'libgcc')
optdepends=('gunicorn: proxy'
            'uvicorn: proxy'
            'python-granian: proxy'
            'python-uvloop: proxy'
            'python-fastapi: proxy'
            'python-starlette: proxy'
            'python-backoff: proxy'
            'python-pyyaml: proxy'
            'python-rq: proxy'
            'python-orjson: proxy'
            'python-hiredis: proxy'
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
            'python-httpx2: proxy'
            'python-pydantic: proxy'
            'python-litellm-proxy-extras: proxy'
            'python-litellm-enterprise: proxy'
            'python-restrictedpython: proxy'
            'python-rich: proxy'
            'python-inquirerpy: proxy'
            'python-tomlkit: proxy'
            'python-polars: proxy'
            'python-soundfile: proxy'
            'python-pyroscope-io: proxy'
            'python-expression: proxy'
            
            'python-rich: cli'
            'python-pyyaml: cli'
            'python-requests: cli'
            'python-inquirerpy: cli'
            'python-keyring: cli'
            'python-tomlkit: cli'
            
            'python-prisma: extra_proxy'
            'python-psycopg: extra_proxy'
            'python-azure-identity: extra_proxy'
            'python-azure-keyvault-secrets: extra_proxy'
            'python-google-cloud-kms: extra_proxy'
            'python-google-cloud-iam: extra_proxy'
            'python-resend: extra_proxy'
            'python-redisvl: extra_proxy'
            'python-a2a-sdk: extra_proxy'
            
            'python-numpydoc: utils'
            
            'python-diskcache: caching'

            'python-mcp: mcp'
            'python-httpx2: mcp'
            'python-pydantic: mcp'

            'python-saml: saml'
            
            'python-semantic-router: semantic-router'
            'python-aurelio-sdk: semantic-router'
            
            'python-mlflow: mlflow'
            
            'python-grpcio: grpc'

            'python-google-cloud-speech: stt-vertex-chirp'

            'python-nvidia-riva-client: stt-nvidia-riva'
            'python-soundfile: stt-nvidia-riva'
            'python-audioread: stt-nvidia-riva'
            'python-numpy: stt-nvidia-riva'
            
            'python-google-cloud-aiplatform: google'

            'python-aws-sdk-bedrock-runtime: bedrock-realtime'
            'python-smithy-http: bedrock-realtime'
            'python-awscrt: bedrock-realtime'
            
            'python-google-cloud-aiplatform: proxy-runtime'
            'python-google-cloud-speech: proxy-runtime'
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
            'python-opentelemetry-instrumentation-fastapi: proxy-runtime'
            'python-ddtrace: proxy-runtime'
            'python-sentry_sdk: proxy-runtime'
            'python-mangum: proxy-runtime'
            'python-azure-ai-contentsafety: proxy-runtime'
            'python-azure-storage-file-datalake: proxy-runtime'
            'python-pypdf: proxy-runtime'
            'python-llm-sandbox: proxy-runtime'
            'python-detect-secrets: proxy-runtime')
makedepends=("python-installer")
provides=("$_name" "python-$_name")
conflicts=("$_name")
# abi3 wheels work with any Python >= 3.10
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_28_aarch64.whl")
noextract=("${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_28_$CARCH.whl")
sha256sums_x86_64=('ec3cae6c87971657c9ae905b6d23aef456e979c8848f22bbc5096a31e1a1da4d')
sha256sums_aarch64=('af0b6f4a3df53194b74188a972f103f41ee5ed86afeefc7d9a1ea40156cc0f2e')

package(){
 python -m installer --destdir="$pkgdir" ./*.whl
 install -d "$pkgdir/usr/share/licenses/$pkgname"
 ln -s "$(python -c 'import site; print(site.getsitepackages()[0])')/${_name//-/_}-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
