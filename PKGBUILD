# Maintainer: Grenish Rai <mrcoder2033d@gmail.com>
pkgname=clipboard-manager-rs-git
pkgver=r48.cb5f397
pkgrel=1
pkgdesc="A simple clipboard manager written in Rust (git version)"
arch=('x86_64')
url="https://github.com/Grenish/clipboard-manager"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libx11')
makedepends=('cargo' 'rust' 'git')
provides=("clipboard-manager")
conflicts=("clipboard-manager" "clipboard-manager-git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "clipboard-manager"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ) ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "clipboard-manager"
  cargo build --release --locked
}

package() {
  cd "clipboard-manager"
  install -Dm755 "target/release/clipboard-manager" "${pkgdir}/usr/bin/clipboard-manager"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
