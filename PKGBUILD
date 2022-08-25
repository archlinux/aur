# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=fcp
pkgname=fcp-git
pkgver=v0.2.1.r9.g6d57487
pkgrel=1
pkgdesc="A faster rust cp command"
arch=('i686' 'x86_64')
url="https://github.com/Svetlitski/fcp"
license=('BSD')
depends=('glibc' )
makedepends=('git' 'rust' 'cargo')
provides=('fcp')
conflicts=('fcp')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  return 0
}

package() {
  cd "${_pkgname}"
  cargo install --no-track --locked --all-features --path . \
    --root "${pkgdir}/usr/"
  install -Dm 644 LICENSE README.md -t "${pkgdir}/usr/share/doc/fcp"
}
