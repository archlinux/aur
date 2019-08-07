# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=shinjiru
pkgver=3.4.0
pkgrel=1
pkgdesc='Qt-based anime tracker for AniList'
arch=(i686 x86_64)
url=https://shinjiru.me
license=(GPL3)
depends=(hicolor-icon-theme libxinerama libxtst qt5-declarative qt5-networkauth)
makedepends=(git qt5-base qt5-tools qt5-quickcontrols qt5-quickcontrols2 libx11)
source=(git+https://github.com/ShinjiruApp/Shinjiru#tag=v$pkgver)
sha512sums=('SKIP')

prepare() {
  cd Shinjiru
  git submodule update --init
}

build() {
  cd Shinjiru
  qmake PREFIX=/usr
  make

  # Make translations
  lupdate Shinjiru.pro
  lrelease Shinjiru.pro
}

package() {
  cd Shinjiru
  make INSTALL_ROOT="$pkgdir" install
}
