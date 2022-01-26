# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="cyberdrop-dl"
pkgver=0.3.2
pkgrel=2
pkgdesc="Cyberdrop downloader"
arch=('x86_64')
url="https://github.com/wmw9/cyberdrop-dl"
license=('undefined')
makedepends=('cargo' 'rust')
conflicts=('cyberdrop-dl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wmw9/cyberdrop-dl/archive/v${pkgver}.tar.gz")
sha256sums=("fedd82fce80c672c66a09ca1f3f0b06180289e41cd91af954af14d729997bafe")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp "target/release/cyberdrop-dl" "$pkgdir/usr/bin"
}
