# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=vomacsd
pkgver=0.1.4
pkgrel=1
pkgdesc="Hookable voice transcription daemon for KDE Wayland"
arch=('any')
url="https://github.com/decent-tools-for-thought/vomacs"
license=('custom:unlicensed')
depends=('python' 'ffmpeg' 'python-websocket-client' 'libnotify')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('xclip: X11 clipboard fallback backend')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59765c1fa355354f72ca2bb7638ed263c2f660a8a0a2df7a0bcdd39853dd5417')

build() {
  cd "$srcdir/vomacs-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/vomacs-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 contrib/vomacsd.service "$pkgdir/usr/lib/systemd/user/vomacsd.service"
  install -Dm644 contrib/vomacsd-kde-helper.service "$pkgdir/usr/lib/systemd/user/vomacsd-kde-helper.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
