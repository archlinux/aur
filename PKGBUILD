# Maintainer: nazar <monom777>
pkgname=sysupdate-git
pkgver=r4.47e0479
pkgrel=1
pkgdesc="A fast and convenient system update utility for Arch Linux written in Go (Bubble Tea)"
arch=('x86_64')
url="https://github.com/monom777/sysupdate"
license=('MIT')
depends=('pacman' 'flatpak')
makedepends=('go' 'git')
provides=('sysupdate')
conflicts=('sysupdate')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  go build -o sysupdate -ldflags="-s -w" .
}

package() {
  cd "${pkgname}"
  install -Dm755 sysupdate "${pkgdir}/usr/bin/sysupdate"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
