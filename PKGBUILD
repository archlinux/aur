pkgname=songfetch
pkgver=1.0.3
pkgrel=1
pkgdesc="A Linux CLI tool that displays current song info (ASCII art requires python-ascii_magic from AUR)"
arch=('any')
url="https://github.com/ekrlstd/songfetch"
license=('GPL-2.0')
depends=(
  'python'
  'python-pillow'
  'playerctl'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'python-ascii_magic: The needed AUR package (or install via pip/pipx as ascii-magic). For ASCII album art'
  'mpdris2: For MPD support'
  'cmus: For cmus support'
  'pipewire: For PipeWire audio backend'
  'pulseaudio: For PulseAudio backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1de83af13b8a16a9281eb5d3952e3d5885e1ac54de49d7801747e8e9cb148828')
# old: 1b4c73283d7b5981b314ae3f77b6150947077aa505ab8869bb12bce0df6f7bf4

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
