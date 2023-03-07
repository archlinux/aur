# Maintainer: Harold Cheng <niuchangcun@gmail.com>
pkgname=kubevela
pkgver=1.7.5
pkgrel=1
pkgdesc="The Modern Application Platform."
arch=("x86_64")
url="https://github.com/kubevela/kubevela"
license=('Apache')
groups=()
depends=()
makedepends=('go')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('aff27830121eb259b20a498f90de9ee3db720a5d02f7c969c052935367bd279d')

build() {
  cd "$pkgname-$pkgver"

  # copied from https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o bin/vela -a ./references/cmd/cli/main.go
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 bin/vela "$pkgdir"/usr/bin/vela
}

