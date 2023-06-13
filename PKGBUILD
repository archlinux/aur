# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=zeitfetch-git
pkgver=r81.dba1df3
pkgrel=1
pkgdesc="a neofetch implementation in Rust aiming to be near instantaneous, with the least amount of dependencies possible"
arch=('x86_64')
url="https://github.com/nidnogg/zeitfetch"
license=('MIT')
makedepends=('cargo' 'git')
depends=('gcc-libs')
source=("git+https://github.com/nidnogg/zeitfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd zeitfetch
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/zeitfetch"
  cargo build --release
}

package() {
  cd "${srcdir}/zeitfetch"
  install -Dm755 "target/release/zeitfetch" "$pkgdir/usr/bin/zeitfetch"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
