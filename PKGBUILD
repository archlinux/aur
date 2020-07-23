# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=lyrics
pkgver=0.8.1
pkgrel=1
pkgdesc="Display lyrics on media players with MPRIS-2 interface"
arch=(x86_64)
url="https://github.com/naaando/lyrics"
license=(GPL3)
depends=(gtk3 libgee libxmlbird lyricsources)
makedepends=(git meson vala)
source=(https://github.com/naaando/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz
        fix-build.patch)
sha256sums=('6a990f7127e684fabb0032cbb7d5ff66155f622e979b106d6ba03ffd2fc84a74'
            '239baeecf76facae33065d02e6d088056f50017612b27c6bdb12a1b8738e0c87')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix-build.patch
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
