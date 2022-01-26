# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="cyberdrop-dl-git"
_pkgname="cyberdrop-dl"
pkgver=0.3.2.r1.g6b831ff
pkgrel=1
pkgdesc="Cyberdrop downloader"
arch=('x86_64')
url="https://github.com/wmw9/cyberdrop-dl"
license=('undefined')
makedepends=('cargo' 'rust')
conflicts=('cyberdrop-dl')
provides=('cyberdrop-dl')
source=("cyberdrop-dl::git+https://github.com/wmw9/cyberdrop-dl.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp "target/release/cyberdrop-dl" "$pkgdir/usr/bin"
}
