# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.2.4
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(i686 x86_64)
license=(GPL)
depends=(libnm-gtk libsecret openvpn)
makedepends=(intltool python)
install=networkmanager-openvpn.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-openvpn/${pkgver::3}/NetworkManager-openvpn-${pkgver}.tar.xz
        buildfix.patch)
sha256sums=('db6b4d5bc49c68990703c90f2cfbdc6a94e16f702b0740085017d5c06d3e5b9d'
            'd300dde598151646554a610256282fc12d098c3bcd19c44e3768efdaa66cea32')

prepare() {
  cd NetworkManager-openvpn-$pkgver
  patch -Np1 -i ../buildfix.patch
  autoreconf -fvi
}

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
