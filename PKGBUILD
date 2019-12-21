# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-desktop-git
pkgver=0.4.r6.gdfbfae8
pkgrel=1
pkgdesc="X Desktop Environment desktop"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-desktop"
license=('GPL')
provides=('xde-desktop'=$pkgver)
conflicts=('xde-desktop')
depends=('libsm' 'libwnck+-git' 'gnome-vfs')
makedepends=('git' 'xorgproto')
source=("$pkgname::git+https://github.com/bbidulock/xde-desktop.git")
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
  ./configure
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
