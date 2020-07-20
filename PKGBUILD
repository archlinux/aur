# Maintainer: Dominik Tarnowski <dom@tdom.dev>
pkgname=sshutils
pkgver=0.1
pkgrel=1
pkgdesc='Essential SSH Utilities'
url="https://github.com/td0m/sshutils"
arch=('any')
license=('MIT')
depends=('strace')
makedepends=('git' 'go')
source=("${pkgname}::git+https://github.com/td0m/sshutils.git")
sha512sums=('SKIP')
provides=("sshutils")
conflicts=("sshutils")

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="-s -w"
export GOFLAGS="-trimpath -mod=readonly -modcacherw"

prepare() {
  cd "$pkgname"
  mkdir build -p
}

build() {
    cd "$pkgname"
    go build -o build/$pkgname ./cmd/main.go
}

package() {
    cd "$pkgname"
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

