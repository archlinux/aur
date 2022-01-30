# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.13.2
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
sha512sums=('63e556c258c074e721f556fa707941ee17d4d821714e995641b282f2e70b12742d2da42adc6e16e4e67a0700dfe4c6a72afa59e5b6458f7e3962083466a15f5c')

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
