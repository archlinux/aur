# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.1.93
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/projects/NetworkManager/"
depends=(libnm-gtk libsecret openvpn)
makedepends=(intltool python)
install=networkmanager-openvpn.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/${pkgver::3}/NetworkManager-openvpn-${pkgver}.tar.xz)
sha256sums=('5de542e995526306bd872ca9c289298bca5660d0ebb8b2b018a4466d27fb6d01')

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
