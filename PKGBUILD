# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=transmission-csd
_gitname=transmission
_gitbranch="wip/gtk-3.14"
pkgver=4.ed0b662
pkgrel=3
pkgdesc="Fast, easy, and free BitTorrent client (GTK+ GUI), CSD port"
arch=('i686' 'x86_64')
license=('GPLv2')
url="https://github.com/derekstavis/${_gitname}/tree/${_gitbranch}"
depends=('curl' 'libevent' 'gtk3' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('gtk3' 'intltool' 'curl' 'libevent')
optdepends=('notification-daemon: Desktop notification support'
            'transmission-cli: daemon and web support')
options=('!emptydirs')
source=("git://github.com/derekstavis/${_gitname}.git#branch=${_gitbranch}")
install="transmission-gtk.install"
conflicts=('transmisison-gtk')
provides=('transmission-gtk')
md5sums=('SKIP')
 
pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}/"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/"
  make -C gtk DESTDIR="$pkgdir" install
  make -C po DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-gtk/COPYING"
}
