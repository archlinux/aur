# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=moksha
pkgver=0.2.0
pkgrel=1
pkgdesc="A fork of the E17 window manager"
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('desktop-file-utils' 'e_dbus' 'elementary')
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
sha256sums=('f03601558902b9f9b286d85aa5da418dfa74acf3e3947992dcb131cc0e44994e')
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
