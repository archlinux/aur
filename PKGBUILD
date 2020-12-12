# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=libepoxy-nodocs-git
pkgver=1.5.4+20+g34ecb90
pkgrel=1
pkgdesc="Library handling OpenGL function pointer management"
url="https://github.com/anholt/libepoxy"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(python git meson)
provides=("libepoxy")
conflicts=("libepoxy")
source=("git+https://github.com/anholt/libepoxy.git")
sha256sums=('SKIP')

pkgver() {
  cd libepoxy
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libepoxy
}

build() {
  arch-meson libepoxy build -D docs=false --libdir="lib"
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 libepoxy/COPYING "$pkgdir/usr/share/licenses/libepoxy/LICENSE"
}
