
pkgname=signond-git
pkgver=8.61.r1.gee891bf
pkgrel=1
pkgdesc='A D-Bus service which performs user authentication on behalf of its clients'
arch=(x86_64)
url='https://gitlab.com/accounts-sso/signond/'
license=(LGPL)
depends=(qt6-base)
makedepends=(doxygen graphviz ttf-font)
conflicts=(signond)
provides=(signond)
source=(git+https://gitlab.com/accounts-sso/signond.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/VERSION_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir" install

  # Do not ship docs
  rm -rf "$pkgdir"/usr/share/doc
}
