# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=cyanrip-git
_gitname=${pkgname%-git}
pkgver=0.9.2.r19.g67ad970
pkgrel=1

pkgdesc="Fully featured CD ripping program"
url="https://github.com/cyanreg/cyanrip"
license=(LGPL-2.1-or-later)
arch=(x86_64)

depends=(
  curl
  glibc
  libavcodec.so
  libavformat.so
  libswresample.so
  libavfilter.so
  libavutil.so
  libcdio
  libcdio-paranoia
  libmusicbrainz5
)
makedepends=(
  git
  meson
  ninja
)

provides=(cyanrip)
conflicts=(cyanrip)

source=("git+$url.git#branch=master")
b2sums=(SKIP)

pkgver() {
  cd "$_gitname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain cyanrip build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
