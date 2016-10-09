# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=FFcast
_ver=2.4.6
pkgname=ffcast
epoch=1
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="run command on rectangular screen regions, e.g. screenshot, screencast"
arch=(any)
url="https://github.com/lolilolicon/FFcast"
license=(GPL3)
depends=('bash>=4.3' xorg-xdpyinfo xorg-xprop xorg-xwininfo xrectsel)
optdepends=('ffmpeg: for png rec' 'imagemagick: for trim')
makedepends=(autoconf automake perl)
source=("https://github.com/lolilolicon/$_name/archive/$_ver.tar.gz")
sha256sums=('c36ac54ef2a7b977a7981a91f7636eadc3ac864153abef9c0671a39ac3a09335')

prepare() {
  cd "$_name-$_ver"
  ./bootstrap
}

build() {
  cd "$_name-$_ver"
  ./configure --prefix /usr --libexecdir /usr/lib --sysconfdir /etc \
    --disable-xrectsel
  make
}

package() {
  cd "$_name-$_ver"
  make DESTDIR="$pkgdir" install
}

# vim:st=2:sw=2:et:
