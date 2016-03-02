pkgname=danmaq-git
pkgdesc="Play Danmaku On Any Screen"
pkgver=0.r70.5c60988
pkgrel=1
arch=("i686" "x86_64")
license=('GPL')
url="https://github.com/bigeagle/danmaQ"
depends=('qt4' 'qjson')
makedepends=('cmake')

source=("$pkgname::git://github.com/bigeagle/danmaQ.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
