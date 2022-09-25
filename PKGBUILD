#PKGBUILD was last modified on September 25, 2022 at 02:34 AM EDT by bms#
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

build() {
  cd "${pkgname%-git}"
  hall build -x
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
