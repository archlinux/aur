# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-photos
pkgver=0.2.4
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('i686' 'x86_64')
url='https://github.com/elementary/photos'
license=('LGPL2.1')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'json-glib' 'libexif'
         'libgee' 'libgexiv2' 'libgphoto2' 'libraw' 'libsoup' 'libxml2' 'pango'
         'rest' 'sqlite' 'webkit2gtk'
         'libgranite.so' 'libgudev-1.0.so')
makedepends=('cmake' 'intltool' 'vala')
source=("pantheon-photos-${pkgver}.tar.gz::https://github.com/elementary/photos/archive/${pkgver}.tar.gz")
sha256sums=('99761b9d6c05292671edef498483ac802d89acf848898bf2c8876825415845e4')

prepare() {
  cd photos-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd photos-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd photos-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
