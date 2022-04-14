# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.3
pkgrel=2
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
provides=('mediarepo-daemon=1.0.3')
makedepends=('clang' 'cargo' 'python' 'lld')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.3.tar.gz)
sha512sums=('3cbaa2dca70ccdd17c8cd70d72d91b01721faf02245bf4a8d7368ea18fa5b0cb51675f8aa76f628c2a388118bb3ce7a63cd241a62916df762bad602e55b70a83')

prepare() {
  cd mediarepo-1.0.3/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.3
  python scripts/build.py daemon --install-tooling
}

package() {
  cd mediarepo-1.0.3/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
