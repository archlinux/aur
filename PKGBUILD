# Maintainer: Johannes Hörmann <aligator@suncraft-server.de>
pkgname=goslice
_pkgname=GoSlice
pkgver=0.4.0
# Hash of the commit to pass it as BUILD version (as it's not retrievable without git)
_pkgverhash=18723ed
pkgrel=1
pkgdesc="An experimental slicer for 3d printing written in Go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/aligator/GoSlice"
license=('Apache')
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aligator/GoSlice/archive/v${pkgver}.tar.gz")
sha512sums=('ec5da3d914ca0350d8ff94a21a4c6ee4cd811038b21c5f9e6cfa15d191741fea33295cc8683b4fad70dcd676444bc42ce466e308e8fd73e7cb259322be049867')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"  

  cd "$srcdir/$_pkgname-$pkgver"
  make VERSION=$pkgver BUILD=$pkgverhash DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make VERSION=$pkgver BUILD=$pkgverhash DESTDIR="$pkgdir" PREFIX="/usr" install
}
