# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=sge-git
pkgver=r6.d7f6e55
pkgrel=1
pkgdesc="SDL Graphics Extension"
arch=('i686' 'x86_64')
url="https://github.com/flibitijibibo/libSGE"
license=("LGPL")
depends=('sdl_image' 'freetype2')
provides=(sge)
source=("${pkgname}"::'git+https://github.com/flibitijibibo/libSGE.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd sge-git
  make
}

package() {
  cd sge-git
  mkdir -p ${pkgdir}/usr/include/SDL2
  install -m644 sge*.h ${pkgdir}/usr/include/SDL2
  install -Dm644 libSGE2.a ${pkgdir}/usr/lib/libSGE2.a
}
