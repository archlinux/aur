# Maintainer: Jerry Lin <jerry73204 at gmail dot com>
pkgname=stage-git
pkgver=r2323.0a7eb63f
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('GPLv2')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('stage::git+https://github.com/rtv/Stage.git')
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}
