# Maintainer: lain <aur@hacktheinter.net>
pkgname=ffts-git
pkgver=r799.fe86885
pkgrel=1
pkgdesc="The Fastest Fourier Transform in the South"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('i686' 'x86_64' 'arm')
url='https://github.com/anthonix/ffts'
md5sums=('SKIP')
license=('BSD')
depends=()
makedepends=('git')
source=('git+https://github.com/anthonix/ffts.git')

pkgver() {
  cd ffts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p ffts/build
  cd ffts/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ffts
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make DESTDIR="$pkgdir" install
}
