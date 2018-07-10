# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha
pkgver=0.3.0
pkgrel=1
pkgdesc="A fork of the E17 window manager used by Bodhi Linux."
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('desktop-file-utils' 'e_dbus' 'efl>1.18' 'xcb-util-keysyms')
optdepends=('acpid: power events on laptop lid close'
            'bc: calculator in everything module'
            'connman: network module'
            'doxygen: build documentation'
            'evas_generic_loaders: provide support for SVG icons'
            'gdb: create backtraces on crash'
            'geoclue2: geolocation module')
provides=('moksha')
conflicts=("enlightenment")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/e-applications.menu')
source=("https://github.com/JeffHoogland/moksha/archive/$pkgver.tar.gz")
sha256sums=('b38c40ef5333a890eaab112c1594744d8acbbb895454baf91175c2949f6fa822')
install='moksha.install'

build() {
  cd $pkgname-$pkgver

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
