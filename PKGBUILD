# Maintainer: Johannes Hörmann <aligator@suncraft-server.de>
pkgname=goslice
_pkgname=GoSlice
pkgver=0.5.0
pkgrel=1
pkgdesc="An experimental slicer for 3d printing written in Go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/aligator/GoSlice"
license=('Apache')
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aligator/GoSlice/archive/v${pkgver}.tar.gz")
sha512sums=('2609644bb457aba77fe925b8e64c75ae1725a498d60e4e6f86a800ae8ced9ddf4eec44048f4835c10e6603268a3fbe250ac6199b8b8b4976665d829883053d77')

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
