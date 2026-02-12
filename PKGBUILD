# Maintainer: ghsc maintainers
pkgname=ghsc-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Ultra-short shortcuts for GitHub CLI workflows (latest git)"
arch=('x86_64' 'aarch64')
url='https://github.com/hassanecoder/ghsc'
license=('MIT')
depends=('git' 'github-cli')
makedepends=('go')
provides=('ghsc')
conflicts=('ghsc' 'ghsc-bin')
options=('!debug')
source=("git+https://github.com/hassanecoder/ghsc.git")
sha256sums=('SKIP')

pkgver() {
  cd ghsc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ghsc
  CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o ghsc ./cmd/ghsc
}

package() {
  cd ghsc
  install -Dm755 ghsc "${pkgdir}/usr/bin/ghsc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/ghsc/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ghsc/LICENSE"
}
