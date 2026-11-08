# Maintainer: Edicson Abel <edicsonabelinfo@gmail.com>
pkgname=download-media
pkgver=0.3.0
pkgrel=1
pkgdesc="Interactive yt-dlp wrapper with probe-first wizard, clipboard, carousel item picker, history, and cookies support"
arch=('any')
url="https://github.com/edicsonabel/download-media"
license=('MIT')
depends=(
  'python>=3.10'
  'yt-dlp'
  'ffmpeg'
  'python-secretstorage'
  'python-curl_cffi'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
optdepends=(
  'xdg-user-dirs: detect localized Videos/Music folders (e.g. Vídeos, Música)'
  'wl-clipboard: clipboard URL detection on Wayland'
  'xclip: clipboard URL detection on X11'
  'xsel: alternate clipboard URL detection on X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('44707029ab71de17ac77cef5aabccb9cc4d59116954e5357195bb98c66d99454')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
