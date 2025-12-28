# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Kasui92/lancher"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f349098b4c552ca20fa46c7e9fbd3d0c00014728087960d80e81828c47fa3228')

build() {
  cd "lancher-$pkgver"

  # Go build flags for Arch
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o lancher .
}

package() {
  cd "lancher-$pkgver"

  # install the binary
  install -Dm755 myapp "$pkgdir/usr/bin/myapp"

  # install the license (required by Arch policy)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # optional - install shell completions if your app generates them
  # install -Dm644 completions/lancher.bash "$pkgdir/usr/share/bash-completion/completions/lancher"
}
