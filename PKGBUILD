# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=zur
pkgver=0.6.0
pkgrel=1
pkgdesc="An AUR helper written in Zig"
arch=("x86_64")
url="https://github.com/hspak/zur"
license=("MIT")
depends=("pacman" "curl")
makedepends=("zig-git" "git")
provides=("$pkgname")
conflicts=("$pkgname" "$pkgname-git")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("4ec682852201fc57f0f1938ca55ab38b8ffa319b17b1aaedefeba792c17d6b20")

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
  zig-out/bin/zur --version
}

package() {
  cd "$(echo $pkgname | cut -d'-' -f1)"
  install -D -m 0755 "zig-out/bin/zur" "${pkgdir}/usr/bin/zur"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
