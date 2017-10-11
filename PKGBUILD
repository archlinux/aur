# Maintainer: Thomas Bork <tab.epic@gmail.com>

pkgname=pamac-classic
_pkgver=6.0.0
pkgver=$_pkgver
pkgrel=3
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://github.com/cromnix/pamac-classic"
license=('GPL3')
depends=('gtk3' 'pango' 'atk' 'cairo' 'gdk-pixbuf2' 'glib2' 'json-glib' 'pacman' 'curl' 'libsoup' 'polkit' 'libnotify' 'vte3' 'zlib' 'pcre2' 'gnutls')
makedepends=('vala' 'glibc' 'pacman' 'cmake' 'gettext' 'intltool')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=("pamac-classic-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('f0d98d735210c999f450c977c63de5b0e4665fa2646bef0f0076752fff912942')

#prepare() {
#  cd "${srcdir}/pamac-classic-$_pkgver"
#  # patches here
#}

build() {
  cd "${srcdir}/pamac-classic-$_pkgver"

  # configure with AUR - add --disable-aur to disable AUR support
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc --pass-thru -DICON_UPDATE=OFF

  # build
  make
}

package() {
  cd "${srcdir}/pamac-classic-$_pkgver"
  make DESTDIR="$pkgdir" install
}
