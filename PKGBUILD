
pkgname=libaccounts-qt-git
pkgdesc='Qt-based client library for accessing the online accounts database'
pkgver=1.16
pkgrel=3
arch=(x86_64)
url='https://gitlab.com/accounts-sso/libaccounts-qt'
license=(LGPL)
depends=(libaccounts-glib qt6-base)
makedepends=(doxygen)
conflicts=(libaccounts-qt)
provides=(libaccounts-qt)
replaces=(libaccounts-qt)
source=(git+https://gitlab.com/accounts-sso/libaccounts-qt.git)
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  sed -i 's|SUBDIRS  += Accounts tests|SUBDIRS += Accounts|' accounts-qt.pro
}

build() {
  cd "${pkgname%-git}"
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir" install

# Remove docs
  rm -r "$pkgdir"/usr/share
}
