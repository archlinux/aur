# Maintainer: Thomas Bork <tab.epic@gmail.com>
pkgname=pamac-classic
_pkgver=6.0.0
pkgver=$_pkgver
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
license=('GPL3')
depends=('libsoup' 'polkit' 'vte3>=0.38'
         'libnotify' 'pacman>=5.0')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.')
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
  ./configure --disable-debug --prefix="${pkgdir}/usr" --sysconfdir="${pkgdir}/etc"
  # add --disable-aur to previous line to disable AUR support

  # build
  make all
}

package() {
  cd "${srcdir}/pamac-classic-$_pkgver"
  make prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" install
  # remove icon-cache
  rm "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
