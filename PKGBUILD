#PKGBUILD was last modified on September 27, 2022 at 04:01 PM EDT by bms#
# Maintainer: Ben Sutter <benjaminsutter@outlook.com>
pkgname=guile-todo-git
pkgver=r15.b812dd7
pkgrel=1
pkgdesc="Lispy todo tracker"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/bms-1984/guile-todo"
license=('GPL')
depends=('guile' 'guile-config')
makedepends=('guile-hall' 'git')
provides=("guile-todo=$pkgver")
options=(!strip)
source=("${pkgname%-git}::git+https://github.com/bms-1984/guile-todo.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  hall build -x
  ./autogen.sh
  ./configure --prefix=/usr
}
  
build() {
  cd "${pkgname%-git}"
  make
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
