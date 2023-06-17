# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nymphcast-mediaserver-git
pkgver=0.1.r1.gf6e615c
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=(x86_64)
url="https://github.com/MayaPosch/NymphCast"
license=(BSD)
depends=(libnymphcast nymphrpc poco glibc gcc-libs)
makedepends=(git)
source=("git+https://github.com/MayaPosch/NymphCast-MediaServer")
sha256sums=('SKIP')

pkgver() {
  cd NymphCast-MediaServer
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd NymphCast-MediaServer
  make
}

package() {
  cd NymphCast-MediaServer
  install -D bin/x86_64-pc-linux-gnu/nymphcast_mediaserver -t "${pkgdir}/usr/bin"
  install -D folders.ini -t "${pkgdir}/etc/nymphcast"
  install -Dm644 systemd/nymphcast_mediaserver.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
