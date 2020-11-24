# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli-git
_pkgname=globe
pkgver=0.2.0.r5.g95413f2
pkgrel=1
pkgdesc="ASCII globe generator (git)"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  # TODO: Use `--locked` flag for reproducibility.
  # Tracking issue: https://github.com/adamsky/globe/pull/21#issuecomment-729935054
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
