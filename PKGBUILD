# Maintainer: Thomas Bork <tab.epic@gmail.com>

pkgname=pamac-classic
pkgver=6.7.0
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://git.cromer.cl/cromer/pamac-classic"
license=('GPL3')
depends=('curl' 'libsoup' 'polkit' 'pacman' 'libnotify' 'vte3')
makedepends=('vala' 'cmake' 'gettext')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=("pamac-classic-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('35639ef352d99f813dc54cf49cd9110a6a1e5852929ea2af0ab1333022c8ed4d')

#prepare() {
#  cd "${srcdir}/pamac-classic"
#  # patches here
#}

build() {
  cd "${srcdir}/pamac-classic"

  # configure with AUR - add --disable-aur to disable AUR support
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc --disable-icon-update

  # build
  make
}

package() {
  cd "${srcdir}/pamac-classic"
  make DESTDIR="$pkgdir" install
}
