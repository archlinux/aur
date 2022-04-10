# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.1
pkgrel=2
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
provides=('mediarepo-daemon=1.0.1')
makedepends=('clang' 'cargo' 'python' 'lld')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.1.tar.gz)
sha512sums=('47693b0334e23fcf9fba766b12f31d5ccadacbf7ad35f53910e3d4ddea98fc53c5d9ab05c92947626c3323cc322e0c35cd083ed2dc2ee125a631d4659cad2c7f')

prepare() {
  cd mediarepo-1.0.1/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.1
  python scripts/build.py daemon --install-tooling
}

package() {
  cd mediarepo-1.0.1/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
