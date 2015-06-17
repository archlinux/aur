# Maintainer: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

pkgname=networkmanager-iodine-git
pkgver=r78.11317d9
pkgrel=1
pkgdesc="Iodine plugin for NetworkManager"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/network-manager-iodine"
license=('GPL')
depends=('iodine' 'networkmanager' 'libgnome-keyring' 'gtk3' 'libnm-gtk')
makedepends=('git' 'intltool')

source=("$pkgname"::'git://git.gnome.org/network-manager-iodine')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$pkgname"
  export CFLAGS="-O2 -Wno-error=deprecated-declarations"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install || return 1
}
