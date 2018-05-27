# Maintainer: Bogdan Sinitsyn <f1u77y@yandex.ru>
pkgname=headphones-plug-detector-git
pkgver=r15.e4c83d0
pkgrel=1
pkgdesc="Pauses media when headphones get plugged out and plays it when they get plugged in"
arch=('i686' 'x86_64')
url="https://github.com/f1u77y/headphones-plug-detector"
license=('MIT')
depends=(
  glib2
  jacklistener-git
)
makedepends=(
  git
  cmake
)
provides=(${pkgname%-git})
conflicts=(
  ${pkgname%-git}
)
source=("${pkgname%-git}::git+https://github.com/f1u77y/headphones-plug-detector.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_SYSTEMD=On ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
