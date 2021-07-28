# Maintainer: Daniel Menelkir <menelkir@itroll.org>
# Contributor: Zach <mikezackles@gmail.com>
# Contributor: James An <james@jamesan.ca>

_pkgname=xf86-input-mtrack
pkgname="$_pkgname-git"
pkgver=0.5.0.r15.g124b80f
pkgrel=1
pkgdesc="A multitouch X driver using the kernel MT protocol"
arch=('i686' 'x86_64')
url="http://github.com/p2rkw/$_pkgname"
license=('GPL')
depends=('mtdev' 'libxss')
makedepends=('xorg-server-devel' 'xorgproto' 'pixman')
provides=("$_pkgname")
conflicts=("$_pkgname" 'xf86-input-synaptics')
backup=('usr/share/X11/xorg.conf.d/10-mtrack.conf')
options=()
install=xf86-input-mtrack-git.install
source=(
  "$_pkgname"::"git+https://github.com/p2rkw/$_pkgname.git"
  10-mtrack.conf
)
md5sums=(
  'SKIP'
  ffb540330d92957e0da28af5a005136e
)

build() {
  cd "$_pkgname"

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/10-mtrack.conf" "$pkgdir/usr/share/X11/xorg.conf.d/10-mtrack.conf"
}
