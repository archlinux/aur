# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=i3-workspace-brightness-git
pkgver=1.0.0.r0.g6f560c3
pkgrel=1
pkgdesc="Utility to auto-adjust the brightness of i3wm workspaces (git)"
arch=('x86_64')
url="https://github.com/orhun/i3-workspace-brightness"
license=('GPL3')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${pkgname%-git}"
  cargo build --release --locked --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
}