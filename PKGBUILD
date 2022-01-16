# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.13.0
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=0.11.0')
makedepends=('clang' 'rustup')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v$pkgver.tar.gz)
sha512sums=('7df423fe274981f50410e30e605f5eb5d7d676a45c7a5f82746013eda56120843483ca5d158ae2809b368e6ab0b4c28e1e6f8ade084c5ae4ae188693825c6981')

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
