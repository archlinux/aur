# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=networkmanager-wireguard
pkgver=0+r87+g0e1124d
_commit=0e1124df9e97129c5e0d9996a2c3876ae18f01c4
pkgrel=1
pkgdesc='NetworkManager VPN plugin for WireGuard'
arch=(x86_64)
license=(GPL2)
url=https://github.com/max-moser/network-manager-wireguard
depends=(networkmanager libnma WIREGUARD-MODULE wireguard-tools libnm-glib libsecret)
makedepends=(git intltool)
source=($pkgname::git+https://github.com/max-moser/network-manager-wireguard.git#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" sysconfdir=/etc libdir=/usr/lib install
}
