# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session-git
pkgver=1.10.r7.gc0fd053
pkgrel=2
pkgdesc="X Desktop Environment Display and Session Management"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
provides=('xde-session')
conflicts=('xde-session')
depends=('m4' 'libunique' 'libxss' 'libxvnc' 'xde-theme' 'xde-ctools-git'
	 'xde-helpers-git' 'xde-menu-git' 'xdg-launch-git' 'libcanberra' 'numlockx')
optdepends=('xorg-xdm-xlogin-git: to use xde-xlogin and xde-xchooser')
makedepends=('git' 'xorgproto')
source=("$pkgname::git+https://github.com/bbidulock/xde-session.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
