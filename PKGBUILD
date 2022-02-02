# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.13.3
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=0.13.2')
makedepends=('clang' 'rustup')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v$pkgver.tar.gz)
sha512sums=('613d25da4e23aaa9cfdb5ef25f6829165785a912334186a5c176955782ec0db1ef5b017c025a7a562b9a3f47d7b4a11cf8be84cfd52b52e66dbc0bd1f286ab47')

prepare() {
  cd mediarepo-$pkgver
  rustup default stable
}

build() {
  cd mediarepo-$pkgver/$pkgname
  cargo build --release --features ffmpeg
}

package() {
  cd mediarepo-$pkgver/$pkgname/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
