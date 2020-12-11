# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2-git
_pkgname=NP2kai
pkgver=20201130.g1c9eb5c
pkgrel=1
pkgdesc="X Neko Project II, a PC-9801 emulator"
arch=('x86_64')
url="http://www.nonakap.org/np2/"
license=('BSD')
depends=('gtk2' 'sdl2_mixer' 'sdl2_ttf' 'openssl' 'libusb')
makedepends=('git' 'cmake' 'ninja')
source=("git+https://github.com/AZO234/NP2kai")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname

    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd $_pkgname
  cmake -B build -S . -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  ninja -C build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sts=2 sw=2 et:
