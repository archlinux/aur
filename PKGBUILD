# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic
pkgver=7.2.0
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://git.cromer.cl/cromer/pamac-classic"
license=('GPL3')
depends=('curl' 'libsoup' 'polkit' 'pacman>=5.2.0' 'libnotify' 'vte3')
makedepends=('vala' 'meson' 'gettext' 'gobject-introspection')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=("pamac-classic-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('2e27b15679539973896910d16d64bc6ebe375452fcefe484dca99b8c890d4a96')

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build

	# configure with AUR - add -DDISABLE_AUR=true to disable AUR support
	meson --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc . build

	# build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" ninja -C build install
}
