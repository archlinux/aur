# Maintainer:  vinszent <vinszent@vinszent.com>

pkgname=gnome-twitch-player-backend-gstreamer-cairo-git
pkgver=r1010.e74f175
pkgrel=1
pkgdesc="GStreamer Cairo (software rendering) player backend for GNOME Twitch"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gnome-twitch-git' 'gtk3' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libpeas' 'gobject-introspection')
source=("$pkgname::git+https://github.com/vinszent/gnome-twitch.git")
md5sums=('SKIP')
conflicts=('gnome-twitch-player-backend-gstreamer-cairo')

pkgver()
{
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${pkgname}"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --libdir lib --buildtype release \
        -Dbuild-executable=false \
        -Dbuild-player-backends=gstreamer-cairo ..
  ninja
}

package()
{
  cd "${pkgname}/build"
  DESTDIR="$pkgdir" ninja install
}
