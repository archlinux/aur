# Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Author: Maep <piconna@googlemail.com>
# Contributor: Guff <cassmacguff@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=fehlstart-git
pkgver=r143.4dc440a
pkgrel=1
pkgdesc="A simple application launcher written in C and using GTK"
arch=('i686' 'x86_64')
url="https://gitlab.com/fehlstart/fehlstart"
license=('GPL3')
depends=('libkeybinder2')
makedepends=('git')
provides=('fehlstart')
conflicts=('fehlstart')

source=('git+https://gitlab.com/fehlstart/fehlstart.git')
md5sums=('SKIP')

pkgver() {
  cd "fehlstart"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/fehlstart"

  make
}

package() {
  cd "$srcdir/fehlstart"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
} 
