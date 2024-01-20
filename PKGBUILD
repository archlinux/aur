# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=FFcast
_ver=2.5.1
pkgname=ffcast
epoch=1
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="run command on rectangular screen regions, e.g. screenshot, screencast"
arch=(any)
url="https://github.com/ropery/FFcast"
license=(GPL3)
depends=('bash>=4.3' xorg-xdpyinfo xorg-xprop xorg-xwininfo xrectsel)
optdepends=('ffmpeg: for png rec' 'imagemagick: for trim' 'graphicsmagick: for trim')
makedepends=(autoconf automake perl)
source=("https://github.com/ropery/$_name/archive/$_ver.tar.gz")
sha256sums=('80b747576492439fcd528eee1bc93bfe2b32b73f6bf9adae73d74666576c9089')

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
