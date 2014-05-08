# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Lauri JÃ¤ntti <janttilauri@gmail.com>

pkgname=openbox-git
pkgver=3.5.2.12.geffa866
pkgrel=1
pkgdesc="A window manager for the X11 windowing system"
arch=(i686 x86_64)
url=http://openbox.org/
license=(GPL2)
depends=(libsm libxcursor libxinerama libxml2 libxrandr pango startup-notification)
makedepends=(docbook-to-man git)
optdepends=('pyxdg: for the xdg-autostart script')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
backup=(etc/xdg/openbox/menu.xml
    etc/xdg/openbox/rc.xml)
options=(!libtool)
install=$pkgname.install
source=($pkgname::git://git.openbox.org/dana/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^release-//;s/-/./g'
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --with-x \
        --enable-startup-notification \
        --sysconfdir=/etc
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
