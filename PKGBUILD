# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=FFcast
_ver=2.4.7
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
sha256sums=('f03d03141aaa6fb6786ecef786849287aac417a689b5e01b821bca691fc075c0')

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
