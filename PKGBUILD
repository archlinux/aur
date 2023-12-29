# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname=koboredux
pkgname=$_pkgname-git
pkgver=0.7.5.1
pkgrel=1
pkgdesc='Arcade style 2D shooter'
arch=(x86_64)
url='http://koboredux.com/'
license=(GPL2)

makedepends=(
  'base-devel'
  'cmake'
)
depends=(
  'sdl'
  'audiality2'
)

conflicts=(
    "$_pkgname"
)
provides=(
    "$_pkgname"
)

source=("git+https://github.com/olofson/koboredux#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  rm -rf build; mkdir build; cd build
  PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH" cmake "$srcdir/$_pkgname"
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
  cd ../$_pkgname

  # install .desktop file
  install -D -m644 "icons/net.olofson.koboredux.desktop" \
    "$pkgdir/usr/share/applications/net.olofson.koboredux.desktop"

  # install icons
  install -Dm644 "icons/koboredux.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/koboredux.png"
}
