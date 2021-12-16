# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.9.0
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-daemon
license=(GPL3)
depends=(ffmpeg)

makedepends=(clang cargo)

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-daemon/archive/v$pkgver.tar.gz)
sha512sums=('d0edc2e32a20add504f6a91565feac60e888a8941516ae2a90e84f24615cdd2d7e27a8370e5ce6599055acaad2f8a35a50a969ed3b6489dbed9dc3d82d25cc2b')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --features ffmpeg
}

package() {
  cd $pkgname-$pkgver/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
