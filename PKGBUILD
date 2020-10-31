# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli-git
_pkgname=globe
pkgver=0.1.1.r0.g6ef5c31
pkgrel=1
pkgdesc="ASCII globe generator (git)"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
makedepends=('cargo' 'git')
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
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
