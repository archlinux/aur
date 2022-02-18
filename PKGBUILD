# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.0_rc.3
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=1.0.0_rc.3')
makedepends=('clang' 'cargo' 'python')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0-rc.3.tar.gz)
sha512sums=('e1149778ada7038ae6ff0cc320687e0b40fb66ee5069f1edd68832c67605fc333a44d91d7ad2a2e22f48bfc8d0f3caec6d17a9dc894d890bf7a8e4553677d6b3')

prepare() {
  cd mediarepo-1.0.0-rc.3/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.0-rc.3
  python scripts/build.py daemon --ffmpeg --install-tooling
}

package() {
  cd mediarepo-1.0.0-rc.3/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
