# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-photos-bzr
pkgver=r2900
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-photos'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'json-glib' 'libexif'
         'libgee' 'libgexiv2' 'libgphoto2'
         'libraw' 'libsoup' 'libxml2' 'pango' 'rest' 'sqlite' 'webkit2gtk'
         'libgranite.so' 'libgudev-1.0.so')
makedepends=('bzr' 'cmake' 'intltool' 'vala')
provides=('pantheon-photos')
conflicts=('pantheon-photos')
install='pantheon-photos.install'
source=('bzr+lp:pantheon-photos')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-photos

  echo "r$(bzr revno)"
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
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-photos/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
