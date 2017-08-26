# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=pcem-wx-sdl2-git
pkgver=r279.cd75b26
pkgrel=1
pkgdesc="Unofficial version of PCem that uses wxWidgets/SDL2"
url="https://github.com/mborjesson/PCem-wx-SDL2"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'sdl2' 'openal')
makedepends=('git')
conflicts=('pcem')
provides=('pcem')
install=pcem-wx-sdl2.install
source=("git+https://github.com/mborjesson/PCem-wx-SDL2.git")
md5sums=('SKIP')

pkgver() {
  cd PCem-wx-SDL2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/PCem-wx-SDL2"
  ./configure --prefix=/usr \
    --enable-wx             \
    --enable-networking
  make
}

package() {
  cd "${srcdir}/PCem-wx-SDL2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
