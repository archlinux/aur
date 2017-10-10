# Maintainer: Thomas Bork <tab.epic@gmail.com>

pkgname=pamac-classic
_pkgver=6.0.0
pkgver=$_pkgver
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4')
makedepends=('gettext' 'itstool' 'vala>=0.36' 'libappindicator-gtk3')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala>=0.36' 'cmake')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
options=(!emptydirs)
install=pamac-classic.install

source=("pamac-classic-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('f0d98d735210c999f450c977c63de5b0e4665fa2646bef0f0076752fff912942')

#prepare() {
#  cd "${srcdir}/pamac-classic-$_pkgver"
#  # patches here
#}

build() {
  cd "${srcdir}/pamac-classic-$_pkgver"

  # configure with AUR
  ./configure --disable-debug --prefix="${pkgdir}/usr" --sysconfdir="${pkgdir}/etc" --pass-thru -DICON_UPDATE=OFF
  # add --disable-aur to previous line to disable AUR support

  # build
  make all
}

package() {
  cd "${srcdir}/pamac-classic-$_pkgver"
  make prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" install
}
