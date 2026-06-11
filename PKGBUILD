# Maintainer: PolJak <polesnik.jaka@gmail.com>

pkgname=curd-polland-git
pkgver=1.5.2.polland
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc. (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pol-Jak-295/curd-polland"
license=('GPL3')
depends=('mpv' 'rofi' 'ueberzugpp')
makedepends=('git' 'go>=1.21')
provides=('curd')
conflicts=('curd')
source=("git+https://github.com/Pol-Jak-295/curd-polland.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/curd-polland"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/curd-polland"
  go mod download
}

build() {
  cd "$srcdir/curd-polland"
  go build -a -trimpath -ldflags="-s -w" -o curd ./cmd/curd
}

package() {
  cd "$srcdir/curd-polland"
  install -Dm755 curd "$pkgdir/usr/bin/curd"
}
