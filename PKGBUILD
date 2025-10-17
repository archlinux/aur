pkgname=songfetch
pkgver=1.0.2
pkgrel=1
pkgdesc="A Linux CLI tool that displays current song information in the terminal, similar to neofetch"
arch=('any')
url="https://github.com/fwtwoo/songfetch"
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
  'ascii-magic'
  'mpdris2: For MPD support'
  'cmus-mpris: For cmus support'
  'pipewire: For PipeWire audio backend'
  'pulseaudio: For PulseAudio backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b4c73283d7b5981b314ae3f77b6150947077aa505ab8869bb12bce0df6f7bf4')

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
