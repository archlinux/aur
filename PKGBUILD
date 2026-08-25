# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus at ouranos dot be>

pkgname=sipgrep
pkgver=2.2.4
pkgrel=1
pkgdesc='A powerful pcap-aware tool command line tool to sniff, capture, display and troubleshoot SIP signaling over IP networks'
arch=('x86_64')
url="https://github.com/sipcapture/${pkgname}"
license=('GPL-3.0-only')
depends=('pcre' 'libpcap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('eb1cad5c63d6ead915c617b3da32ef97dc1e4272e73dd13af07bc75566ebf30c')

build() {
  cd "${pkgname}-${pkgver}"

  ./build.sh
  ./configure --prefix=/usr --enable-ipv6
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 sipgrep.8 "${pkgdir}/usr/share/man/man8/sipgrep.8"
}
