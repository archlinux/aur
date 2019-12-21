# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets-git
pkgver=0.6.r5.g9957432
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-applets"
license=('GPL')
provides=('xde-applets')
conflicts=('xde-applets')
depends=('libsm' 'libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors'
		'libpackagekit-glib' 'cpupower' 'upower')
makedepends=('dbus-glib' 'libunique' 'xorgproto' 'git')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("$pkgname::git+https://github.com/bbidulock/xde-applets.git")
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
