# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=omphalos
pkgver=0.99.14
pkgrel=1
pkgdesc="Network enumeration and domination"
url="https://nick-black.com/dankwiki/index.php/Omphalos"
license=('GPL3')
arch=('x86_64')
depends=('libpciaccess' 'libpcap' 'zlib' 'wireless_tools' 'sysfsutils'
         'notcurses>=2.4.4')
makedepends=('docbook-xsl' 'cmake' 'libxslt' 'ninja')
source=("https://github.com/dankamongmen/omphalos/archive/v${pkgver}.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

build() {
  cd "${pkgname}-${pkgver}/build"
  ninja
}

check() {
  cd "${pkgname}-${pkgver}/build"
  ninja test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  DESTDIR="$pkgdir" ninja install
  install -m 0644 -D -t "$pkgdir/usr/share/omphalos" ../ieee-oui.txt
}

sha256sums=('65fd63d62bf9f047bb9898fd114ebc1b9e02842f1297c702fe5da1314bba3714')
