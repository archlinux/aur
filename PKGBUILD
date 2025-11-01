# Contributor: gilcu3
# Maintainer: gilcu3

pkgname=watch-your-lan
_pkgname=WatchYourLAN
pkgver=2.1.4
pkgrel=1
pkgdesc='Lightweight network IP scanner with web GUI.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/aceberg/WatchYourLAN"
license=('MIT')
depends=('arp-scan' 'tzdata')
makedepends=('go')
source=("$url/archive/refs/tags/$pkgver.tar.gz" "$_pkgname.install")
sha256sums=('fca5dcb9cb9e170f88fcc1aba27d62bf3d2b86f195a723b39eaf0466e59280f2'
            'd632e52726e2de9217df8e8a5e6f73697cee38a2b40e2d1c502ff4a603937765')
install=$_pkgname.install


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"

build() {
  cd $_pkgname-$pkgver
  cd backend/cmd/$_pkgname
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/backend/cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
