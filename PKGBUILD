# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.0_rc.4
pkgrel=2
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
provides=('mediarepo-daemon=1.0.0_rc.4')
makedepends=('clang' 'cargo' 'python' 'lld')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0-rc.4.tar.gz)
sha512sums=('23c3688bd944b946456b824e12b8d52445eac553f7df4a3f275db69f3bafdfd88d9912b871c17b8256e13fb41f6a114b657b65230f71d52039716debe058d15c')

prepare() {
  cd mediarepo-1.0.0-rc.4/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.0-rc.4
  python scripts/build.py daemon --install-tooling
}

package() {
  cd mediarepo-1.0.0-rc.4/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
