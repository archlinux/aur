# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=torrential-git
pkgver=2.0.1.r0.gd17fc27
pkgrel=1
pkgdesc="Download torrents in style with this speedy, minimalist torrent client designed for Pantheon Shell"
arch=(i686 x86_64)
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(libgranite.so libb64 libevent libnatpmp miniupnpc)
makedepends=(git meson ninja vala dht libutp libtransmission)
provides=(torrential)
conflicts=(torrential)
source=("git+https://github.com/davidmhewitt/torrential.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.davidmhewitt.torrential "$pkgdir/usr/bin/torrential"
}

