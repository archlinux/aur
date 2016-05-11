# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.2.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(i686 x86_64)
license=(GPL)
depends=(libnm-gtk libsecret openvpn)
makedepends=(intltool python)
install=networkmanager-openvpn.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/${pkgver::3}/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('47a6d219a781eff8491c7876b7fb95b12dcfb8f8a05f916f95afc65c7babddef')

build() {
  cd NetworkManager-openvpn-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd NetworkManager-openvpn-$pkgver
  make DESTDIR="$pkgdir" install
}
