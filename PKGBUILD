# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=slider-cli-git
pkgver=0.5.1.r0.gff53d59
pkgrel=1
pkgdesc="Command-line implementation and Golang library for the RAMMB/CIRA SLIDER satellite image viewer"
arch=("x86_64")
url="https://github.com/colinmcintosh/SLIDER-cli"
license=("Apache-2.0")
depends=("glibc")
makedepends=("git" "go" "make")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  make VERSION="$pkgver" build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 slider-cli "$pkgdir/usr/bin/slider-cli"
}
