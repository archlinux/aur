# Maintainer: diego7319 <diego7319@gmail.com>

pkgname=cpupower-gui-new
pkgver=1.0.2
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
sha256sums=('83393b71f658e92f1b12170308116f0dbda8d27b347c0fcc0101fa37361af6a9')

build() {
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/cpupower-gui-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
