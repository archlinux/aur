# Maintainer: Artiom Molchanov <a.mv@gmx.fr>

pkgname=mtplvcap-git
_pkgname=mtplvcap
pkgver=r358.55683b4
pkgrel=1
license=('BSD')
pkgdesc="Relay the Live View of Nikon cameras via WebSocket"
makedepends=('go' 'libusb')
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("$pkgname::git+https://github.com/puhitaku/mtplvcap")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd $pkgname
   export CGO_LDFLAGS="${LDFLAGS}"
   export CGO_CFLAGS="${CFLAGS} -Wno-deprecated-declarations'"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   go build -o $_pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $_pkgname "${pkgdir}"/usr/bin/$_pkgname

}
