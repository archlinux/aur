# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>

pkgname=decibel-audio-player
pkgver=1.08
pkgrel=6
pkgdesc="GTK+ audio player"
arch=('any')
url="http://decibel.silent-blade.org/"
license=('GPL')
depends=('desktop-file-utils' 'gstreamer0.10-python' 'mutagen' 'pygtk' 'python2-dbus' 'python2-notify')
optdepends=('cddb-py: CDDB info' 'python2-pillow: cover art')
install=$pkgname.install
source=(http://decibel.silent-blade.org/uploads/Main/decibel-audio-player-$pkgver.tar.gz)
md5sums=('e8ebaf819c198ff9951903e7c4056aef')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|\(^[ ]*\)import Image$|\1from PIL import Image|' src/modules/Covers.py
}

package() {
  cd $pkgname-$pkgver
  make CONFIGURE_IN='sed -e "s|prefix|$(prefix)|g;s|^python |python2 |"' \
       prefix=/usr DESTDIR="$pkgdir/" install
}

