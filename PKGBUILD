# Maintainer: Anatol Pomozov

pkgname=tang.go-git
pkgver=r21.14a5a12
pkgrel=1
pkgdesc='Tang key manager tools'
arch=(x86_64)
url='https://github.com/anatol/tang.go'
license=(BSD-3)
depends=(glibc)
makedepends=(git go)
source=(git+https://github.com/anatol/tang.go)
sha512sums=('SKIP')

pkgver() {
  cd tang.go
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tang.go

  (cd cmd/tangctl && go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"")
}

package() {
  cd tang.go

  install -Dp -m755 cmd/tangctl/tangctl "$pkgdir/usr/bin/tangctl"
}
