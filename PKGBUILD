# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=fakeapi-git
pkgver=r194.0d9663f # This gets auto-updated by the pkgver() function
pkgrel=1
pkgdesc="Customizable local REST API for testing."
arch=('x86_64')
url="https://github.com/vncsmyrnk/fakeapi"
license=('GPL-3.0')
depends=()
makedepends=('git' 'go')
provides=('util')
conflicts=('util')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}" || return
  go build \
    -ldflags="-s -w" \
    -trimpath \
    -o ./dist/fakeapi \
    ./cmd/cli/main.go
}

package() {
  cd "${pkgname%-git}" || return
  install -Dm755 ./dist/fakeapi "${pkgdir}/usr/bin/util"
}
