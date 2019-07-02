# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic
pkgver=6.7.2
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

source=(
	"pamac-classic-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"pamacclassic-6.0.gir"
	)
sha256sums=('453620021cb9345a133db3ceed80eba62e23398358e8868bfc8e9602d4889055'
            '8ec24aee43b1d4ad6788174a3ffb41eacd2b5438c065fc058dfccb31ceb0b57f')

prepare() {
  # install missing file from 6.7.0 sources
  cp "${srcdir}/pamacclassic-6.0.gir" "${srcdir}/pamac-classic/src/pamacclassic-1.0.gir"
}

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
