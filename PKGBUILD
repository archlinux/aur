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
sha256sums=('SKIP')  # you can replace SKIP with the real checksum later

_builddir="${srcdir}/arch-setup-${pkgver}"  # GitHub tag v1.0.1 extracts to arch-setup-1.0.1

build() {
  cd "${_builddir}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o bas-tui ./cmd/archsetup
}

package() {
  cd "${_builddir}"
  install -Dm755 bas-tui "${pkgdir}/usr/bin/bas-tui"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
