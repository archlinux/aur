# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=blobby-volley-git
_pkgname=blobbyvolley2
pkgver=1.0.r266.g2198980
pkgrel=1
pkgdesc="Official continuation of the famous Blobby Volley 1.x arcade game"
arch=('x86_64')
url="https://github.com/danielknobe/blobbyvolley2"
makedepends=('git' 'boost' 'cmake' 'zip')
depends=('physfs' 'sdl2')
license=('GPL')
provides=('blobby2')
conflicts=('blobby2')
source=("git+https://github.com/danielknobe/blobbyvolley2")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
