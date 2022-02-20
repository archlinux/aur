# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.0
pkgrel=2
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
provides=('mediarepo-daemon=1.0.0')
makedepends=('clang' 'cargo' 'python' 'lld')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0.tar.gz)
sha512sums=('bd3d497760d6fe1c4ceaa11b42c9d7348078d39e6ead5566eb816fad37438ffd59c5e8edb6256a4a9f1dd757a50bb566588a2f32a533b9b8c7a748fb8c970f91')

prepare() {
  cd mediarepo-1.0.0/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.0
  python scripts/build.py daemon --install-tooling
}

package() {
  cd mediarepo-1.0.0/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
