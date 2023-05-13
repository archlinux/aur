# Maintainer: Harold Cheng <niuchangcun@gmail.com>
pkgname=kubevela
pkgver=1.8.1
pkgrel=1
pkgdesc="The Modern Application Platform. (CLI)"
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
sha256sums=('6f2bd0746a7864eb7d2093fbc027b5d5a4ca358d51fc6ec325e21d456c166799')

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags "-X github.com/oam-dev/kubevela/version.VelaVersion=$pkgver -linkmode external" -o bin/vela -a ./references/cmd/cli/main.go
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 bin/vela "$pkgdir"/usr/bin/vela
}

