# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: fancris3 <fancris3 at aol.com>
pkgname=flybird
pkgver=0.3.0
pkgrel=2
pkgdesc="A dual-paned GTK+ file manager with integrated tabbed consoles and gnome-vfs support"
arch=('i686' 'x86_64')
url="http://daafm.sourceforge.net/"
license=('GPL')
depends=('eel-language' 'gnome-menus' 'vte')
makedepends=('pkgconfig' 'scons')
install=flybird.install
source=(http://downloads.sourceforge.net/daafm/flybird_${pkgver//./_}.tar.bz2)
md5sums=('eeeb707d388dbc6ba91d8d1d6b22e457')

build() {
  cd "$srcdir/flybird_${pkgver//./_}"
  sed -i '2 d; 10 d; s/Application;//' flybird.desktop
  scons prefix=/usr install_gconf_scheme=no
  scons prefix="$pkgdir/usr" install
  install -Dm644 flybird.desktop "$pkgdir/usr/share/applications/flybird.desktop"

  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/flybird.schemas" \
    src/flybird_preferences.schemas || return 1
}
