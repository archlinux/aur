# Contributor (Arch): Marti Raudsepp <marti@juffo.org>
# Maintainer: fauno <fauno@parabola.nu>

pkgname=networkmanager-openswan
_pkgname=NetworkManager-openswan
pkgver=1.0.0
pkgrel=1
pkgdesc="NetworkManager plugin for IPSec VPN tunnels"
arch=('i686' 'x86_64' 'mips64el')
url="http://ftp.acc.umu.se/pub/GNOME/sources/NetworkManager-openswan/"
license=('GPL')
depends=('openswan' 'gtk3' 'networkmanager' 'libgnome-keyring' 'libnm-gtk' 'libsecret')
makedepends=('intltool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/$_pkgname/1.0/$_pkgname-$pkgver.tar.xz)
sha256sums=('baac8816c95cc8d50aa00cbe8a78d8ddeb0b8ce710367e7e776ef36dd80c97fd')

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
  sed -e "s/-Werror//g" -i src/Makefile
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
