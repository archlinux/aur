# Maintainer: Thomas Bork <tab.epic@gmail.com>

pkgname=pamac-classic
_pkgver=6.3.4
pkgver=$_pkgver
pkgrel=1
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
sha256sums=('c78d898502678651b8ea3862344fd84b01cad0a1ab48c9179db88743f6fb1b84')

#prepare() {
#  cd "${srcdir}/pamac-classic-$_pkgver"
#  # patches here
#}

build() {
  cd "${srcdir}/pamac-classic-$_pkgver"

  # configure with AUR - add --disable-aur to disable AUR support
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc --disable-icon-update

  # build
  make
}

package() {
  cd "${srcdir}/pamac-classic-$_pkgver"
  make DESTDIR="$pkgdir" install
}
