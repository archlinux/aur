# Original package:
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

# Patched package:
# Maintainer: Rick <rick.2889@gmail.com>

pkgname=pamac-pacaur
pkgver=4.1.2
_pkgver=4.1.2
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm patched to work with pacaur"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4'
         'shared-mime-info' 'desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('pacaur: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/v$_pkgver.tar.gz")
sha256sums=('a8b7dbe7ac77b54bfbf002b94d53783d8dfc30885a397e0cf29ffcc397cffe47')

prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"4.1.0\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala 
  # patches here
  sed -i -e "s/yaourt/pacaur/g" src/transaction.vala
  sed -i -e "s/yaourt/pacaur/g" src/preferences_dialog.vala
  sed -i -e "s/yaourt/pacaur/g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

# vim:set ts=2 sw=2 et:
