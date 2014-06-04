# Contributor (Arch): Marti Raudsepp <marti@juffo.org>
# Maintainer: fauno <fauno@parabola.nu>

pkgname=networkmanager-openswan
_pkgname=NetworkManager-openswan
pkgver=0.9.8.4
pkgrel=1
pkgdesc="NetworkManager plugin for IPSec VPN tunnels"
arch=('i686' 'x86_64')
url="http://ftp.acc.umu.se/pub/GNOME/sources/NetworkManager-openswan/"
license=('GPL')
depends=('openswan' 'gtk3' 'networkmanager' 'libgnome-keyring')
makedepends=('intltool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/$_pkgname/0.9/$_pkgname-$pkgver.tar.xz)
md5sums=('6a373868f85ac3b7c953f7fd6c76e637')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
#  sed -e "s/gnome_keyring_memory_free/gcr_secure_memory_free/g" \
#      -e "s/gnome_keyring_memory_strdup/gcr_secure_memory_strdup/g" \
#      -e "s/gnome_keyring_find_itemsv_sync/secret_service_search_sync/g" \
#      -i auth-dialog/main.c
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/networkmanager

  sed -e "s/-Werror//g" -i auth-dialog/Makefile
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('6cb2b64bc79c4174856613d077667b66')
