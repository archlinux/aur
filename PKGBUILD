# Maintainer: DarkBones

pkgname=bas-tui
pkgver=1.0.1
pkgrel=1
pkgdesc="Bootstrap Any System (BAS) TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/DarkBones/arch-setup"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('bas-tui')
conflicts=('arch-tui')

source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

_builddir="${srcdir}/arch-setup-${pkgver}"

build() {
  cd "${srcdir}/arch-setup-${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o bas-tui ./cmd/archsetup
}

package() {
  cd "${srcdir}/arch-setup-${pkgver}"
  install -Dm755 bas-tui "${pkgdir}/usr/bin/bas-tui"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
