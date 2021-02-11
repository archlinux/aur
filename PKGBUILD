# Maintainer: Petr Spacek <pspacek at isc dot org>

pkgname=dnsperf-git
pkgver=2.4.1.r1.903088a
_pkgsubver=1
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('GPL')
source=("git+https://github.com/DNS-OARC/dnsperf.git")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/dnsperf"
}

pkgver() {
  cd "${srcdir}/dnsperf"
  printf "%s" "$(git describe --match 'v*' --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/dnsperf"
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/dnsperf"
  make DESTDIR="${pkgdir}" install
}

