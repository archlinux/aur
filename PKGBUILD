# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-theme-manager
pkgver=2.12.2
pkgrel=1
pkgdesc='A simple application to manage HexChat themes'
arch=('i686' 'x86_64')
url='https://hexchat.github.io'
license=('GPL')
depends=('mono' 'hexchat')
makedepends=('monodevelop')
source=("https://dl.hexchat.net/hexchat/hexchat-$pkgver.tar.xz")
sha256sums=('6dad783f37aac32a8301a12d498af7a74900f011aec4e77bb378ae9797a3ccf6')

build() {
  cd "hexchat-$pkgver"

  # This builds more than necessary, TODO: fix upstream
  ./configure --prefix=/usr --with-theme-manager --disable-libnotify \
    --disable-libproxy --disable-openssl --disable-libcanberra \
    --disable-gtkfe --disable-plugin --disable-dbus --disable-nls
  make
}

package() {
  cd "hexchat-$pkgver"

  make install DESTDIR="$pkgdir"

  # Translations are always built, TODO: fix upstream
  rm -r "$pkgdir/usr/share/locale"
}

