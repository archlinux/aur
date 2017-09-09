# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>

pkgname=pamac-aur-git
_pkgname=pamac
pkgver=v5.1.1.r2.g80ea4ea
_pkgver=6.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22' 'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4' 'appstream-glib' 'archlinux-appstream-data')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('gettext' 'itstool' 'vala>=0.36')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
options=(!emptydirs)
install=pamac.install

source=(git+https://github.com/manjaro/pamac.git)
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # adjust version string
  cd "$_pkgname"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
  # patches here
}

build() {
  cd "$_pkgname"

  # build
  make all
}

package() {
  cd "$_pkgname"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}
# vim:set ts=2 sw=2 et:
