# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-photos-git
pkgver=8.0.0.r21.g742f6d1b
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('x86_64')
url='https://github.com/elementary/photos'
license=('LGPL2.1')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'gst-plugins-base-libs'
         'gstreamer' 'gtk3' 'json-glib' 'libexif' 'libgee' 'libgexiv2'
         'libgphoto2' 'libraw' 'libsoup' 'libxml2' 'pango' 'rest' 'sqlite'
         'webkit2gtk'
         'libgranite.so' 'libgudev-1.0.so')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala')
provides=('pantheon-photos')
conflicts=('pantheon-photos')
source=('pantheon-photos::git+https://github.com/elementary/photos.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-photos

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-photos build \
    -Dlibunity='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
