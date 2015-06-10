# Maintainer: Lars Hagström <lars@teg>
pkgname=airtame-cli-git
pkgver=r36.0eb1a15
pkgrel=1
pkgdesc="The AIRTAME Command Line interface"
arch=('i686' 'x86_64')
url="http://www.airtame.com"
license=('GPLv3')
groups=()
depends=("jsonrpc-c-git")
makedepends=()
backup=()
options=()
install=
source=("$pkgname"::"git+https://github.com/airtame/airtame-cli.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
