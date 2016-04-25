# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jakob Nixdorf <flocke@user-helfen-usern.de>

_pkgname=decibel-audio-player
pkgname=$_pkgname-bzr
pkgver=r181
pkgrel=2
pkgdesc="GTK+ audio player"
arch=('any')
url="http://decibel.silent-blade.org/"
license=('GPL')
makedepends=('bzr')
depends=('desktop-file-utils' 'gstreamer0.10-python' 'mutagen' 'pygtk' 'python2-dbus' 'python2-notify')
#cddb-py
optdepends=('python2-pillow: to display coverart')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::bzr+https://code.launchpad.net/decibel-audio-player/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd $pkgname
  sed -i 's|\(^[ ]*\)import Image$|\1from PIL import Image|' src/modules/Covers.py
}

package() {
  cd $pkgname
  cp start-release.sh start.sh
  cp start-remote-release.sh start-remote.sh
  make CONFIGURE_IN='sed -e "s|prefix|$(prefix)|g;s|^python |python2 |"' \
       prefix=/usr DESTDIR="$pkgdir/" install
}

