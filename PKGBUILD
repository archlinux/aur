# Maintainer: noriah vix <vix at noriah dot dev>
pkgname=catnip
pkgver=1.8.7
pkgrel=1
pkgdesc="terminal audio visualizer for linux/unix/macOS/windows written in go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/noriah/catnip"
license=('MIT')
depends=('ffmpeg')
optdepends=(
  'portaudio: PortAudio support'
)
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/noriah/catnip/archive/v${pkgver}.tar.gz")
sha256sums=('59413846f463ae8adc564b49260b1d646a2d0377928e0445790e7816e2af5369')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED="${CGO_ENABLED:-1}"

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
