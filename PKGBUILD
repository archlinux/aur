# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.10.0
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-daemon
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=0.10.0')
makedepends=('clang' 'rustup')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-daemon/archive/v$pkgver.tar.gz)
sha512sums=('6d2a548a25c1fe512ed409df9063d7cab8873df264f44454968f219ff2ae9a3f456b8d69425294527d424bc3cc9e8c53e75c78cc947e671f426f202f019c5c48')

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
