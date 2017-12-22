# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-photos-git
pkgver=r3907.47ed37bc
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('x86_64')
url='https://github.com/elementary/photos'
license=('LGPL2.1')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'json-glib' 'libexif'
         'libgee' 'libgexiv2' 'libgphoto2' 'libraw' 'libsoup' 'libxml2' 'pango'
         'rest' 'sqlite' 'webkit2gtk'
         'libgranite.so' 'libgudev-1.0.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-photos')
conflicts=('pantheon-photos')
replaces=('pantheon-photos-bzr')
source=('pantheon-photos::git+https://github.com/elementary/photos.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-photos

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-photos

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-photos/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd pantheon-photos/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
