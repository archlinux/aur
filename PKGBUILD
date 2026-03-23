# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=spitter
pkgver=0.1.1
pkgrel=2
pkgdesc="Self-documenting Cartesia speech CLI with websocket sessions"
arch=('any')
url="https://github.com/decent-tools-for-thought/spitter"
license=('MIT')
depends=('python' 'ffmpeg' 'pipewire' 'libpulse')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c7bfc6ed68256f43e35c33f14c392aeca9e10da0cb18a735ba1c9af153b2aa18')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
