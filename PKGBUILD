# Maintainer: vagnum08 <diego7319@gmail.com>

pkgname=cpupower-gui-new
pkgver=1.0.1
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits, forked from  github.com/vagnum08"
arch=(any)
url="https://github.com/diego7319/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject' 'python-pyxdg' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
	    'libappindicator-gtk3: needed for tray icon')

makedepends=('meson' 'desktop-file-utils' 'appstream-glib')
provides=("${pkgname}")
conflicts=("${pkgname}")
install=cpupower_gui.install
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/diego7319/cpupower-gui/archive/v${pkgver}.tar.gz")
sha256sums=('7eb780ff801c79e4a6c94e2607be981fdc61a05c28aee20a70ff3392fdce3cad')

build() {
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/cpupower-gui-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
