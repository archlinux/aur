# Maintainer: Nemin <pergerlori@gmail.com>
pkgname=relive-git
pkgver=r3166.4bc00b39
pkgrel=2
pkgdesc="An open-source Abe's Oddysee / Abe's Exoddus engine"
arch=('i686' 'x86_64')
url="https://aliveteam.github.io"
license=('unknown')
depends=('sdl2' 'zenity')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('relive::git+https://github.com/AliveTeam/alive_reversing')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init --recursive
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -B build -S .
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make install
}
