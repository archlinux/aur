# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo-daemon
pkgver=1.0.0_rc.2
pkgrel=1
pkgdesc='Daemon to manage a media repository'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
depends=('ffmpeg')
provides=('mediarepo-daemon=1.0.0_rc.2')
makedepends=('clang' 'cargo' 'python')

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0-rc.2.tar.gz)
sha512sums=('6d7cc3e7d2d352df0f482ce14469fe3a1b8de364f5ffab809fa1222ecc976aaa9f973564e8229f9c2e3884f4364ede217e1abbffb252b611de7a1d6f85775968')

prepare() {
  cd mediarepo-1.0.0-rc.2/$pkgname
  cargo fetch
}

build() {
  cd mediarepo-1.0.0-rc.2
  python build.py build --daemon --ffmpeg
}

package() {
  cd mediarepo-1.0.0-rc.2/out

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-daemon "$pkgdir"/usr/lib/mediarepo-daemon
  ln -s /usr/lib/mediarepo-daemon "$pkgdir"/usr/bin
}
