# Maintainer: Marc MAURICE <marc-archlinux at pub.positon.org>
# Maintainer: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=xfdashboard-git
pkgver=r1254.111a6cd
pkgrel=2
pkgdesc="Maybe a Gnome shell like dashboard for Xfce"
conflicts=('xfdashboard')
provides=('xfdashboard')
arch=('i686' 'x86_64')
url="http://xfdashboard.froevel.de/"
license=('GPL')
depends=('clutter>=1.12' 'dbus-glib>=0.98' 'garcon>=0.2.0' 'glib2>=2.32' 'libwnck3>=3.0' 'xfconf>=4.10.0')
makedepends=('xfce4-dev-tools' 'git')
source=("git://github.com/gmc-holle/xfdashboard.git")
sha1sums=('SKIP')

# https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
  cd "$srcdir/xfdashboard"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/xfdashboard"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/xfdashboard"
  make DESTDIR="$pkgdir" install
}
