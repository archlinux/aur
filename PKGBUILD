# Maintainer: Rudolf Polzer <divVerent at gmail dot com>
pkgname=aaaaxy
pkgver=1.0.187
pkgrel=3
pkgdesc='A nonlinear puzzle platformer taking place in non-Euclidean geometry'
arch=('x86_64')
url="git+https://github.com/divVerent/$pkgname"
license=('Apache')
makedepends=('git' 'go' 'graphviz' 'imagemagick' 'make')
source=("$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init
}

build() {
  cd "$pkgname"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make BUILDTYPE=release
}

package() {
  cd "$pkgname"
  install -Dm644 io.github.divverent.$pkgname.metainfo.xml "$pkgdir"/usr/share/metainfo/io.github.divverent.$pkgname.metainfo.xml
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
