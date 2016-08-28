# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-theme-manager
pkgver=2.12.1
pkgrel=1
pkgdesc='A simple application to manage HexChat themes'
arch=('i686' 'x86_64')
url='https://hexchat.github.io'
license=('GPL')
depends=('mono' 'hexchat')
makedepends=('monodevelop')
source=("https://dl.hexchat.net/hexchat/hexchat-$pkgver.tar.xz")
sha256sums=('5201b0c6d17dcb8c2cb79e9c39681f8e052999ba8f7b5986d5c1e7dc68fa7c6b')

build() {
  cd "hexchat-$pkgver"

  # This builds more than necessary but oh well
  ./configure --prefix=/usr --with-theme-manager \
    --disable-gtkfe --disable-plugin --disable-dbus --disable-nls
  make
}

package() {
  cd "hexchat-$pkgver"

  # TODO: Fix this upstream

  pushd data/misc
  make install DESTDIR="$pkgdir"
  popd

  pushd src/htm
  make install DESTDIR="$pkgdir"
  popd

  rm -r "$pkgdir/usr/share/appdata"
  rm "$pkgdir/usr/share/applications/hexchat.desktop"
}

