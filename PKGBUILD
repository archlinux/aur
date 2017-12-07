# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=libringclient
pkgver=20171129.2.cf5bbff
pkgrel=1
epoch=2
pkgdesc="Client communication library for ring.cx (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="https://ring.cx"
license=('GPL3')
groups=("ring")
depends=("ring-daemon" "qt5-base")
makedepends=('git' 'cmake' 'qt5-tools')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-lrc#commit=ec8c1780da19cd9781518ff790c965ab6e423662")
md5sums=('SKIP')

build() {
  cd "ring-lrc"

  msg2 'Building...'
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "ring-lrc/build"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
