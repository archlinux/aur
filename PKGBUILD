# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.4
pkgrel=2
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
provides=('mediarepo-daemon=1.0.4')
makedepends=('clang' 'cargo' 'python' 'lld')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.4.tar.gz)
sha512sums=('70632724c1c372de79553d9776c57f353c0775e5489bc43f4e0353fa17c2341224145feaa0fd0798d3947a03450d76cd861005f541e47f906457766d727ab870')

prepare() {
  cd mediarepo-1.0.4/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.4
  python scripts/build.py daemon --install-tooling
}

package() {
  cd mediarepo-1.0.4/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
