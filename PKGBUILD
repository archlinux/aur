# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: henning mueller <mail@nning.io>
# Contributor: Ariel Popper <a@arielp.com>
# Contributor: mortzu <me@mortzu.de>

pkgname=thc-ipv6-git
_pkgname=${pkgname/-git}
pkgver=v3.6.r1.gdcd270b
pkgrel=1
pkgdesc='Complete tool set to attack the inherent protocol weaknesses of IPv6 and ICMP6'
url='https://github.com/vanhauser-thc/thc-ipv6'
arch=('x86_64')
license=('AGPL3')
depends=('libpcap' 'openssl' 'libnetfilter_queue')
makedepends=('git')
provides=('thc-ipv6')
conflicts=('thc-ipv6')
source=(${pkgname}::git+https://github.com/vanhauser-thc/${_pkgname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -E 's|\.r0\.\w+$||'
}

prepare() {
  cd ${pkgname}
  sed 's|CFLAGS=|CFLAGS+=|g' -i Makefile
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 README CHANGES HOWTO-INJECT -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
