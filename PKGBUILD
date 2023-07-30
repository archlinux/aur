pkgname=aboxes-git
pkgver=0.2.1
pkgrel=1
pkgdesc='Run one or more commands on multiple remote hosts via SSH'
arch=('any')
url="https://github.com/AlexanderGrooff/aboxes"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o output-binary
}

package() {
  cd "$pkgname"
  install -Dm755 output-binary "$pkgdir"/usr/bin/aboxes
}
