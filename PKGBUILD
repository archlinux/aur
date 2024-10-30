# Maintainer: envolution
# Contributor: Olliver Schinagl <oliver@schinagl.nl>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
pkgname=openfortivpn-git
_pkgname=openfortivpn
pkgver=v1.22.1+6+gc49663d
pkgrel=1
pkgdesc="An open implementation of Fortinet's proprietary PPP+SSL VPN solution"
arch=(x86_64)
url=https://github.com/adrienverge/openfortivpn
license=(GPL3)
depends=(
  glibc
  openssl
  ppp
  resolvconf
  systemd-libs
)
makedepends=(
  git
  systemd
  autoconf
)
provides=('openfortivpn')
conflicts=('openfortivpn')
backup=(etc/openfortivpn/config)
source=(git+https://github.com/adrienverge/openfortivpn.git)
sha256sums=('SKIP')

prepare() {
  cd openfortivpn
  autoreconf -fiv
}

pkgver() {
  cd openfortivpn
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd openfortivpn
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-resolvconf
  make
}

package() {
  make DESTDIR="${pkgdir}" -C openfortivpn install
}

# vim: ts=2 sw=2 et:
