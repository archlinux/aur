# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic
pkgver=7.0.1
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://git.cromer.cl/cromer/pamac-classic"
license=('GPL3')
depends=('curl' 'libsoup' 'polkit' 'pacman' 'libnotify' 'vte3')
makedepends=('vala' 'meson' 'gettext' 'gobject-introspection')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=("pamac-classic-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('e6748f4942c687cf019f32274c1c046eaf90e952a402fab46c32d45fdd665cc3')

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
