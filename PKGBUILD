# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus at ouranos dot be>

pkgname=sipgrep
pkgver=2.2.5
pkgrel=1
pkgdesc='A powerful pcap-aware tool command line tool to sniff, capture, display and troubleshoot SIP signaling over IP networks'
arch=('x86_64')
url="https://github.com/sipcapture/${pkgname}"
license=('GPL-3.0-only')
depends=('pcre' 'libpcap')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a5355339f5a059351616e8c848a7d107b01542b6d3a7b2af4e569f0c8e104b66')

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
