# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=goslice
_pkgname=GoSlice
pkgver=0.3.9
# Hash of the commit to pass it as BUILD version (as it's not retrievable without git)
_pkgverhash=d5c7a2e
pkgrel=2
pkgdesc="An experimental slicer for 3d printing written in Go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/aligator/GoSlice"
license=('AGPL')
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aligator/GoSlice/archive/v${pkgver}.tar.gz")
sha512sums=('d377cf3f31a188fe5ebeaeec4ea70c2178120dc8778cd4ede954c6972ecbc804ae7f03b92b84810ca02ff9cbc12458c2820d4b13bc8c086db47b47d554f86d61')

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
