pkgname=xfce4-notifyd-keyaction
srcname=xfce4-notifyd
pkgver=0.2.4
pkgrel=1
pkgdesc="Notification daemon for the Xfce desktop. Super+N executes the first action"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfce4-notifyd"
license=('GPL2')
groups=('xfce4-goodies')
depends=('libxfce4ui' 'libnotify' 'hicolor-icon-theme' 'libkeybinder3')
makedepends=('intltool')
replaces=('xfce4-notifiyd')
conflicts=('xfce4-notifyd')
provides=('notification-daemon')
install=$srcname.install
source=(http://archive.xfce.org/src/apps/$srcname/0.2/$srcname-$pkgver.tar.bz2
        keybinder.patch)
sha256sums=('8c7ed62f9496816d1391281f77d1b32216f9bf6fd22fbe4f6f3f4e07a6bbced0'
            'c6c040602ff207ebf3ed73edc50ae67d905485867bf79f11361c18ffc224cca1')

build() {
  cd "$srcdir/$srcname-$pkgver"

  patch -i ../../keybinder.patch -p1

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$srcname-$pkgver"
  make DESTDIR="$pkgdir" install
}

