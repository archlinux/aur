# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=goslice
_pkgname=GoSlice
pkgver=0.3.7
# Hash of the commit to pass it as BUILD version (as it's not retrievable without git)
_pkgverhash=993d1e8
pkgrel=1
pkgdesc="An experimental slicer for 3d printing written in Go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/aligator/GoSlice"
license=('AGPL')
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aligator/GoSlice/archive/v${pkgver}.tar.gz")
sha512sums=('e9d41bacde15ab1b6e3b05f362ab46bdff387a504555a32909ad0d44fbb45701cd71ff8eda57c07d9af777ea7314df191bb5372b1e107b3f88fb058eaca4b223')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
#  These are not working, don't know why
#  export CGO_CFLAGS="${CFLAGS}"
#  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname-$pkgver"

  make VERSION=$pkgver BUILD=$pkgverhash DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make VERSION=$pkgver BUILD=$pkgverhash DESTDIR="$pkgdir" PREFIX="/usr" install
}
