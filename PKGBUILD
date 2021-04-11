# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur-git
pkgver=0.5.0+3+g49035b5
pkgrel=1
pkgdesc="An AUR helper written in Zig"
arch=("x86_64")
url="https://github.com/hspak/zur"
license=("MIT")
depends=("pacman" "curl")
makedepends=("zig-git" "git")
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/hspak/zur")
sha256sums=("SKIP")

pkgver() {
  cd "$(echo $pkgname | cut -d'-' -f1)"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "$(echo $pkgname | cut -d'-' -f1)"
  zig build -Dversion="${pkgver}" -Drelease-safe=true
}

check() {
  cd "$(echo $pkgname | cut -d'-' -f1)"
  zig-cache/bin/zur --version
}

package() {
  cd "$(echo $pkgname | cut -d'-' -f1)"
  install -D -m 0755 "zig-cache/bin/zur" "${pkgdir}/usr/bin/zur"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
