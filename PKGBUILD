# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic
pkgver=6.7.3
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://git.cromer.cl/cromer/pamac-classic"
license=('GPL3')
depends=('curl' 'libsoup' 'polkit' 'pacman' 'libnotify' 'vte3')
makedepends=('vala' 'cmake' 'gettext' 'gobject-introspection')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=("pamac-classic-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72203ce9ce5faadd3bda843f4558216a8dd7ada46bf2b8a30893d35254a28c1f')

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
