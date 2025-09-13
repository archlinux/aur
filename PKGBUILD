# Maintainer: DarkBones

pkgname=bas-tui
pkgver=1.0.7
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
sha256sums=('53f093943c489af4634267e7b9e5a5f565783aedcc00cc4255e9fff3ba99b9a8')

_builddir="${srcdir}/arch-setup-${pkgver}"

pkgrel=1

build() {
  cd "${srcdir}/arch-setup-${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o "${srcdir}/bas-tui" ./cmd/archsetup
}

package() {
  install -Dm755 "${srcdir}/bas-tui" "${pkgdir}/usr/bin/bas-tui"
  if [[ -f "${srcdir}/arch-setup-${pkgver}/LICENSE" ]]; then
    install -Dm644 "${srcdir}/arch-setup-${pkgver}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
