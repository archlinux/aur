# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-theme-manager
pkgver=2.14.3
pkgrel=1
pkgdesc='A simple application to manage HexChat themes'
arch=('i686' 'x86_64')
url='https://hexchat.github.io'
license=('GPL')
depends=('mono' 'hexchat')
makedepends=('monodevelop')
source=("https://dl.hexchat.net/hexchat/hexchat-$pkgver.tar.xz")
sha256sums=('901a9d13db5a4da69b827f6093306bbd16863dc49016f7668bd3e4506512e882')

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

