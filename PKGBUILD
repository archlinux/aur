# Contributor: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui-git
pkgver=1.0.0.r31.gfcaab4e
pkgrel=2
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL-3.0-or-later')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject' 'python-pyxdg' 'libhandy')
makedepends=('git' 'meson' 'pkg-config' 'appstream-glib' 'desktop-file-utils')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'libappindicator-gtk3: needed for tray icon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cpupower_gui.install
source=("${pkgname%-git}::git+https://github.com/vagnum08/cpupower-gui.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson -Dsystemddir=/usr/lib/systemd "$srcdir/${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
