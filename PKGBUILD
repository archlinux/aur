# Maintainer: DarkBones

pkgname=bas-tui-git
pkgver=r3.1b6aebc
pkgrel=1
pkgdesc="Bootstrap Any System (BAS) TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/DarkBones/arch-setup"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('bas-tui')
conflicts=('bas-tui')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

_repo=arch-setup

pkgver() {
  cd "${srcdir}/${_repo}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_repo}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o bas-tui ./cmd/archsetup
}

package() {
  cd "${srcdir}/${_repo}"
  install -Dm755 bas-tui "${pkgdir}/usr/bin/bas-tui"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
