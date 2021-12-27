# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.11.0
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
sha512sums=('ba8f01d15f77c5a160be9cbc15417de4f26dcee673f6355c59d3eaf4703ed6d7c6b035cf2105467c160cda7a4985066c44aa81f05d25b1ae53ef51fcefb50bd0')

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
