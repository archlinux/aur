# Maintainer: enihcam <enihcam at noreply dot gitcode dot com>

pkgname=python-slack-bolt
pkgver=1.29.0
pkgrel=1
pkgdesc="The Bolt Framework for Python — build Slack apps with sync or async (asyncio) execution"
arch=('any')
url="https://github.com/slackapi/bolt-python"
license=('MIT')
depends=(
  'python'
  'python-slack-sdk'
)
optdepends=(
  'python-aiohttp: async support via AsyncApp and aiohttp adapter'
  'python-websockets: async Socket Mode support'
  'python-flask: Flask adapter'
  'python-django: Django adapter'
  'python-fastapi: FastAPI adapter'
  'python-starlette: Starlette adapter'
  'python-tornado: Tornado adapter'
  'python-bottle: Bottle adapter'
  'python-pyramid: Pyramid adapter'
  'python-falcon: Falcon adapter'
  'python-cherrypy: CherryPy adapter'
  'python-boto3: AWS Lambda and Chalice adapters'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# Upstream PyPI sdist filename uses an underscore (`slack_bolt-<ver>.tar.gz`),
# but we rename on download so the source matches the pkgname.
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/slack-bolt/slack_bolt-$pkgver.tar.gz")
sha256sums=('b6271ba0a9b71e319c86b40632e6cb6240aacd0433773615b76b890b9a574762')

build() {
  cd "$srcdir/slack_bolt-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/slack_bolt-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
