# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname=curd-git
_pkgname=curd
pkgver=20260102.r1f990ab
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
makedepends=('git' 'go')
provides=('curd')
conflicts=('curd')

prepare() {
  rm -rf "$_pkgname"
  git clone --depth 1 "https://github.com/Wraient/curd" "$_pkgname"
}

pkgver() {
  cd "$_pkgname"
  git show -s --format=%cd.r%h --date=short | sed 's/-//g'
}

build() {
  cd "$_pkgname"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o curd ./cmd/curd
}

package() {
  cd "$_pkgname"
  install -Dm755 curd "$pkgdir/usr/bin/curd"
}
