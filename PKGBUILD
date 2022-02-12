# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.0_rc.1
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=1.0.0_rc.1')
makedepends=('clang' 'cargo')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0-rc.1.tar.gz)
sha512sums=('d65a7c086b636457fe0104ae07b164545bfd2e679169a1a1d671a58d0216607d543e8e98851c5c63cee27f8e2bf901ca53b0731cbe8ab331ac91d115ea6650f8')

prepare() {
  cd mediarepo-1.0.0-rc.1/mediarepo-daemon
  cargo fetch
}

build() {
  cd mediarepo-1.0.0-rc.1/$pkgname
  cargo build --frozen --release --features ffmpeg
}

package() {
  cd mediarepo-1.0.0-rc.1/$pkgname/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
