pkgname=rnnoise-git
_pkgname=rnnoise
pkgver=r81.90ec41e
pkgrel=1
pkgdesc="A noise suppression library based on a recurrent neural network."
arch=(i686 x86_64)
url="https://github.com/xiph/rnnoise"
license=('BSD3')
provides=('rnnoise')
conflicts=('rnnoise')
source=("git+https://github.com/xiph/rnnoise")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
