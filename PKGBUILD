# Maintainer: Thomas Bork <tab.epic@gmail.com>

pkgname=pamac-classic
pkgver=6.7.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
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
sha256sums=('54a505c56d06860464a8c1c694834cbc3b863da569a77900d3b29b3ae78dad05')

#prepare() {
#  cd "${srcdir}/pamac-classic-$pkgver"
#  # patches here
#}

build() {
  cd "${srcdir}/pamac-classic-$pkgver"

  # configure with AUR - add --disable-aur to disable AUR support
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc --disable-icon-update

  # build
  make
}

package() {
  cd "${srcdir}/pamac-classic-$pkgver"
  make DESTDIR="$pkgdir" install
}
