pkgname=notify-osd-syaoran
_realname=notify-osd
pkgver=0.9.34
pkgrel=1
_realver=${pkgver}+16.04.20160415
pkgdesc="daemon that displays passive pop-up notifications, with leolik patch added"
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/notify-osd-syaoran.git"
license=('GPL')
#groups=()
depends=('libwnck3' 'libnotify>=0.7.0' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
makedepends=('pkgconfig' 'libnotify' 'gnome-common' 'git')
provides=('notification-daemon' 'notify-osd')
conflicts=('notify-osd')
#install=$pkgname.install
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
	sh ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile
  	make
 }

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
#	install -D -m644 ${srcdir}/notify-osd ${pkgdir}/etc/skel/.notify-osd
 }
