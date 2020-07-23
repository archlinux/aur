# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=lyricsources
pkgver=0.1
pkgrel=1
pkgdesc="Lyric downloader dbus service from osdlyrics"
arch=(any)
url="https://github.com/naaando/lyricsources"
license=(GPL3)
depends=(python2-dbus python2-gobject2 python2-pycurl)
makedepends=(git meson)
source=(https://github.com/naaando/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('363407184541762121a954d1d96265d86510906a38662f4f5113e5c5bc4405e7')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/dist-packages/site-packages/' meson.build
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
