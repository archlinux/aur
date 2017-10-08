pkgname=gtkplatform-git
pkgver=0.1.0.r8.1e6222f
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('i686' 'x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
makedepends=('git')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/CrimsonAS/gtkplatform.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir/" install
}
