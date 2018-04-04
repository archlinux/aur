# Maintainer: edward-p <micro dot fedora at gmail dot com>

pkgname=signon-ui-webengine
pkgver=0.17
pkgrel=0
pkgdesc='"webengine" branch of signon-ui for issue #1'
arch=('x86_64')
url="https://launchpad.net/online-accounts-signon-ui"
license=('GPL')
conflicts=(signon-ui)
depends=('libaccounts-qt' 'qt5-webkit' 'signon' 'libnotify')
provides=('signon-ui')
source=(git+https://gitlab.com/accounts-sso/signon-ui.git)
md5sums=('SKIP')

prepare() {
  cd $srcdir/signon-ui
  git checkout -b webengine origin/webengine
  # Do not install tests
  echo 'INSTALLS =' >>tests/unit/tst_inactivity_timer.pro
  echo 'INSTALLS =' >>tests/unit/tst_signon_ui.pro
}

build() {
  cd $srcdir/signon-ui

  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd $srcdir/signon-ui

  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
