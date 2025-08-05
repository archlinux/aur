# Maintainer: Beacrox beacrox@atl.tools

pkgname=pulse-visualizer-git
pkgver=1.0.r100.g6ddb8a5
pkgrel=5
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire (latest git)"
arch=('any')
url="https://github.com/Beacroxx/pulse-visualizer"
license=('MIT')
depends=('sdl2' 'fftw' 'freetype2' 'glew' 'yaml-cpp' 'libebur128')
makedepends=('cmake' 'ninja' 'clang' 'git')
optdepends=('libpulse: PulseAudio support' 'libpipewire: PipeWire support')
source=("git+https://github.com/Beacroxx/pulse-visualizer.git")
sha256sums=('SKIP')
install=pulse-visualizer-git.install

pkgver() {
  cd "$srcdir/pulse-visualizer"
  printf "1.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pulse-visualizer"
  mkdir -p build
  cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  ninja
}

package() {
  cd "$srcdir/pulse-visualizer/build"
  DESTDIR="$pkgdir" ninja install
  install -Dm644 "$srcdir/pulse-visualizer/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
