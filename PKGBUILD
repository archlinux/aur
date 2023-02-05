# Maintainer: freehelpdesk <freehelpdesk@proton.me>

pkgname=parceli-git
pkgver=0.0.1
pkgrel=1
pkgdesc='CLI implementation of a package/mail tracker for USPS/UPS/FedEx made in Go using the parcel library and a bit of smarts.'
arch=('x86_64')
url="https://github.com/cryptofyre/parceli"
license=('GPLv3')
makedepends=(go git gcc)
source=("git+$url")
sha256sums=('SKIP')

pkgvar() {
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd "parceli"
  mkdir -p build/
}

build() {
  cd "parceli"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "parceli"
  install -Dm755 parceli "$pkgdir"/usr/bin/parceli
}
