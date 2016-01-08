# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools-git
pkgver=1.0.4.g38b288c
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
provides=('xde-ctools')
conflicts=('xde-ctools')
depends=('libsm' 'libwnck+' 'gtk2')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/xde-ctools.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -e 's,^[a-zA-Z_]*,,;s,-,.,g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
