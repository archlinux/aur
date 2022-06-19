# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=FFcast
_ver=2.5.0
pkgname=ffcast
epoch=1
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="run command on rectangular screen regions, e.g. screenshot, screencast"
arch=(any)
url="https://github.com/ropery/FFcast"
license=(GPL3)
depends=('bash>=4.3' xorg-xdpyinfo xorg-xprop xorg-xwininfo xrectsel)
optdepends=('ffmpeg: for png rec' 'imagemagick: for trim')
makedepends=(autoconf automake perl)
source=("https://github.com/ropery/$_name/archive/$_ver.tar.gz")
sha256sums=('09ebf44f76a1813eb8db78df0256f7a1cd259562cf87908b6d683f7fd1ec6b30')

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
