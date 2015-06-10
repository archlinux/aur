# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=drawpile
pkgver=0.9.9
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('x86_64' 'i686')
url='http://drawpile.net/'
license=('GPL2')
makedepends=('qt5-base' 'karchive' 'qt5-tools' 'qt5-translations' 'qt5-svg' 'qt5-multimedia' 'ninja')
depends=('qt5-base' 'karchive' 'qt5-tools' 'qt5-translations' 'qt5-svg' 'qt5-multimedia' 'cmake')
optdepends=('libmicrohttpd')
source=("http://drawpile.net/files/src/$pkgname-$pkgver.tar.gz")
sha256sums=('72c98f7b5b3bed49067518872bc9bbc5ab05bb3e79ae588bcb036234627dede6')

build() {
  cd "$pkgname-$pkgver"

  # Ensure build is an empty directory
  rm -rf build
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "desktop/$pkgname-128x128.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "desktop/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
