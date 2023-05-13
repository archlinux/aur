# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-slack-sdk
pkgver=3.21.3
pkgrel=1
pkgdesc="Slack Python SDK"
arch=(any)
url="https://slack.dev/$pkgname"
license=(MIT)
depends=(python-aiohttp)
optdepends=(python-aiodns python-sqlalchemy python-websocket-client python-websockets)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-flask python-flask-sockets python-moto)
replaces=(python-slackclient)
conflicts=(python-slackclient)
source=($pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('b8da8aa774deff9586fedc6d7d6b8ce83e949b0989f35b9adc6f85f3d0ecf677')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=1 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
