# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=respite-git
pkgver=1.0.0.r0.g141648b
pkgrel=1
pkgdesc="A GTK3 media player (fork of Parole, Xfce deps removed) - git version"
arch=('x86_64' 'i686')
url="https://github.com/Twilight0/respite"
license=('GPL-2.0-or-later')
depends=(
  'dbus-glib'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'taglib'
  'xapp'
)
makedepends=(
  'meson'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'taglib'
  'libnotify'
  'xapp'
)
optdepends=(
  'libnotify: desktop notifications plugin'
  'gst-plugins-ugly: additional codec support'
  'gst-plugins-bad: additional codec support'
  'gst-libav: ffmpeg/libav decoder support'
)
source=("git+https://github.com/Twilight0/respite.git#commit=141648b")
sha256sums=('SKIP')

pkgver() {
  cd respite
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd respite
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd respite
  DESTDIR="$pkgdir" meson install -C build
}
