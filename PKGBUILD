# Contributor: reimu <r2hkri at gmail com>
pkgname=swayblocks
pkgver=r60.6aa045d
_commit=6aa045d8119d647bca04f0250e3d23c4c0491bc3
pkgrel=1
pkgdesc="a highly customizable, language agnostic status bar manager for i3 and sway written in elixir"
arch=("i686" "x86_64")
url="https://github.com/rei2hu/$pkgname"
license=("GPL")
conflicts=("$pkgname")
provides=("$pkgname")
depends=("elixir")
makedepends=("elixir" "git")
optdepends=(
  "acpi: for battery script",
  "brightnessctl: for brightness script",
  "cmus: for cmus script",
  "alsa-utils: for volume script")
source=("git+$url#commit=$_commit")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make create
  make build
}

package() {
  mkdir -p "$pkgdir/usr/bin" && mv "$srcdir/$pkgname/swayblocks" "$pkgdir/usr/bin"
}
