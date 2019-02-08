# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=l-smash-git
pkgver=v2.14.5.18.gf963b5a
pkgrel=1
pkgdesc="MP4 muxer and other tools. (GIT Version)"
arch=('x86_64')
url='http://l-smash.github.io/l-smash'
license=('custom:l-smash')
depends=('glibc')
makedepends=('git')
provides=('l-smash'
          'liblsmash.so'
          )
conflicts=('l-smash')
source=('git+https://github.com/l-smash/l-smash.git')
sha256sums=('SKIP')

pkgver() {
  cd l-smash
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  ../l-smash/configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static


  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 l-smash/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
