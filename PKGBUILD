# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-photos-git
pkgver=8.0.1.r51.g8b0b21da
pkgrel=1
pkgdesc='The Pantheon Photos Manager'
arch=('x86_64')
url='https://github.com/elementary/photos'
license=('LGPL2.1')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'gst-plugins-base-libs'
         'gstreamer' 'gtk3' 'json-glib' 'libexif' 'libgee' 'libgexiv2'
         'libgphoto2' 'libraw' 'libsoup' 'libxml2' 'pango' 'librest' 'sqlite'
         'webkit2gtk' libhandy libportal libportal-gtk3
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
  arch-meson pantheon-photos build

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
