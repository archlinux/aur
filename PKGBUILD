# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools-git
pkgver=1.11.r1.g9338899
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
provides=('xde-ctools')
conflicts=('xde-ctools')
depends=('libxss' 'libsm' 'libwnck+-git' 'libcanberra' 'libnotify')
makedepends=('dbus-glib' 'libunique' 'git' 'xorgproto')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("$pkgname::git+https://github.com/bbidulock/xde-ctools.git")
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
