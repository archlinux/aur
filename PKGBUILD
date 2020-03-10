pkgname=rygel-git
_pkgname=rygel
pkgver=0.38.2+34+g4b7d6a6a
pkgrel=1
pkgdesc="UPnP AV MediaServer and MediaRenderer that allows you to easily share audio, video and pictures, and control of media player on your home network"
url="https://wiki.gnome.org/Projects/Rygel"
arch=(x86_64)
license=(LGPL)
depends=('gupnp' 'gupnp-av' 'gupnp-dlna' 'libgee' 'gtk3' 'libunistring' 'tracker' 'libmediaart')
makedepends=('vala' 'gobject-introspection' 'git' 'meson')
optdepends=('gst-plugins-base: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'tracker-miners: Share indexed media files')
provides=('rygel')
conflicts=('rygel')
backup=('etc/rygel.conf')
source=("git+https://gitlab.gnome.org/GNOME/rygel.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^RYGEL//;s/^rygel-//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
