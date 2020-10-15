# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui
pkgver=0.9.1
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject' 'pyxdg')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
	    'libappindicator-gtk3: needed for tray icon')

makedepends=('meson')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/vagnum08/cpupower-gui/archive/v${pkgver}.tar.gz")
sha256sums=('986e9024970aa19095119637b94fb961b7504a36936727d0a105d3c557dbea35')

build() {
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
