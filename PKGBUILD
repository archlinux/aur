# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=diskm8-git
_pkgname=diskm8
pkgver=r36.4bb682e
pkgrel=1
pkgdesc="DiskM8 Apple II disk image manipulation, cataloging and analysis tool"
arch=('x86_64')
url="https://github.com/paleotronic/diskm8"
license=('GPL3')
depends=()
optdepends=()
makedepends=('go')
source=("${_pkgname}::git+"https://github.com/paleotronic/diskm8.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
#  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  GOOS=linux GOARCH=amd64 go build -o diskm8
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir/usr/bin"
  install -Dm775 "$srcdir/$_pkgname/diskm8" ${pkgdir}/usr/bin/

  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
