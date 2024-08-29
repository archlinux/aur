# Maintainer: Sebastian Krebs <sebastian@krebs.one>
# Contributor: Gabriel M. Dutra <nulldutra@proton.me>

pkgname=opentofu-git
pkgver=r32269.2e4f764
pkgrel=1
pkgdesc="OSS tool for building, changing, and versioning infrastructure safely and efficiently."
url='https://github.com/opentofu/opentofu'
arch=('x86_64')
license=('MPL2')
provides=('opentofu')
conflicts=('opentofu' 'opentofu-bin' 'opentofu-bin-stable')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd opentofu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd opentofu
  # taken from Makefile (to avoid make dependency)
  CGO_ENABLED=0 go build -ldflags "-X main.version=$(git describe --tags --always --dirty)" -o tofu ./cmd/tofu
}

package() {
  cd opentofu
  install -Dm755 tofu "$pkgdir/usr/bin/tofu"
}

