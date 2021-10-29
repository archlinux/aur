# Maintainer: Eric Toombs
pkgname=mech
pkgver=1.36.3
pkgrel=2
pkgdesc="An anonymous automated instagram, reddit, soundcloud, vimeo, and youtube downloader."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/89z/mech"
license=('GPL3')
makedepends=(
  'go'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/89z/mech/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a050a1fe936728356eaced07f5b776294bf5bf43aeb746f2898130aa577d2c81')

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  cd "$srcdir/$pkgname-$pkgver"
  if [[ ! -d build ]]; then
      mkdir build
  fi
  cd build
  find ../cmd -maxdepth 1 -mindepth 1 -type d -exec go build {} \;
}

package() {
  install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver"/build/*
}
