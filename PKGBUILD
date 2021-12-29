# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.12.0
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-daemon
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=0.11.0')
makedepends=('clang' 'rustup')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-daemon/archive/v$pkgver.tar.gz)
sha512sums=('c1ac1015d2e557f3fad68f6e0a2560d99a8990e8f96e4d8601530aa0117143392562024eb3e4e847bdbf917c5db2a752272b19e133bc078aacc365831715828b')

prepare() {
  cd $pkgname-$pkgver
  rustup default stable
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
