# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-$_name
pkgver=0.17.5
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffelib' 'python-typing_extensions' 'python-requests' 'python-websockets' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-xdist' 'python-inline-snapshot' 'python-graphviz' 'python-fastapi' 'python-aiosqlite' 'python-cryptography' 'python-fakeredis'  'python-pymongo' 'litellm' 'python-sqlalchemy' 'python-docker' 'python-runloop_api_client')
optdepends=('python-numpy: voice' 'python-websockets: voice'
            'python-graphviz: viz'
            'litellm: litellm'
            'python-any-llm-sdk: any-llm'
            'python-websockets: realtime'
            'python-sqlalchemy: sqlalchemy' 'python-asyncpg: sqlalchemy'
            'python-cryptography: encrypt'
            'python-redis: redis'
            'python-dapr: dapr' 'python-grpcio: dapr'
            'python-pymongo: mongodb'
            'python-docker: docker'
            'python-blaxel: blaxel' 'python-aiohttp: blaxel'
            'python-daytona: daytona'
            'python-aiohttp: cloudflare'
            'python-e2b: e2b' 'python-e2b-code-interpreter: e2b'
            'python-modal: modal'
            'python-runloop_api_client: runloop'
            'python-vercel: vercel'
            'python-boto3: s3'
            'python-temporalio: temporal' 'python-textual: temporal')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('5dd46943b993e1a68a78acd254fc6a00cf0455fc3dcc802078ea26964b14278c')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/src OPENAI_API_KEY=fake-for-tests pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
