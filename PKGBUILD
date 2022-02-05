# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=0.13.4
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=0.13.4')
makedepends=('clang' 'rustup')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v$pkgver.tar.gz)
sha512sums=('bc1587a184a6620b44951ec28784cff07d83fa08ac5af896b3f79c0792c3b3d8ff7a1ddf0287d7323af3efa745aa39e1c78157f60638291797854ce2e512f31f')

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
