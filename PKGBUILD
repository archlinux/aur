# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>

pkgname=np2kai-git
pkgver=rev.19.47.ge0b9fe5
pkgrel=1
pkgdesc="Neko Project II Kai, a PC-9801 emulator. (GIT version)"
arch=('x86_64')
url='http://domisan.sakura.ne.jp/article/np2kai/np2kai.html'
license=('MIT')
depends=('gtk2'
         'sdl2_mixer'
         'libxxf86vm'
         'libsm'
         )
makedepends=('nasm')
conflicts=('np2kai')
provides=('np2kai')
source=('np2kai::git+https://github.com/AZO234/NP2kai.git')
sha256sums=('SKIP')

pkgver() {
  cd np2kai
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd np2kai/x11

  ./autogen.sh

  cd "${srcdir}/build"
  ../np2kai/x11/configure \
    --prefix=/usr \
    --enable-build-all \
    --enable-ia32 \

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}/" install

  install -Dm644 np2kai/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
