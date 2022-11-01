# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=torrential
pkgver=2.0.1
pkgrel=2
pkgdesc='Simple BitTorrent client for Pantheon'
arch=('x86_64')
url='https://github.com/davidmhewitt/torrential'
license=('GPL')
depends=('granite' 'libevent' 'libb64' 'miniupnpc' 'libnatpmp')
makedepends=('meson' 'git' 'vala' 'libtransmission' 'dht' 'libutp')
_commit=d17fc2728056af0e4abdf4d025a7f415900eeedb
source=("git+https://github.com/davidmhewitt/torrential.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.davidmhewitt.torrential "$pkgdir/usr/bin/$pkgname"
}
