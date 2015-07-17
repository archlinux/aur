# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=l-smash-git
pkgver=v2.3.0.147.gad4d50a
pkgrel=1
pkgdesc="MP4 muxer and other tools. (GIT Version)"
arch=('i686' 'x86_64')
url='http://l-smash.github.io/l-smash'
license=('custom:l-smash')
depends=('glibc')
makedepends=('git')
provides=('l-smash' 'liblsmash.so')
conflicts=('l-smash' 'liblsmash.so')
source=('git+https://github.com/l-smash/l-smash.git')
sha1sums=('SKIP')

pkgver() {
  cd l-smash
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd l-smash
  ./configure --prefix=/usr \
              --enable-shared \
              --disable-static
  make
}

package() {
  cd l-smash
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
