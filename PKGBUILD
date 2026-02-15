# Maintainer: ppqcheck-git
pkgname=ppqcheck-git
pkgver=r4.5cf45e5
pkgrel=1
pkgdesc="CLI tool to check if mobileprovision files have PPQ entitlement"
arch=('x86_64' 'aarch64')
url="https://github.com/planeklm/ppqcheck"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/David31104455/ppqcheck.git#branch=feature/cli-improvements")
sha256sums=('SKIP')

pkgver() {
  cd "ppqcheck"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "ppqcheck"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  go build -o ppqcheck main.go
}

package() {
  cd "ppqcheck"
  install -Dm755 ppqcheck "$pkgdir/usr/bin/ppqcheck"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
