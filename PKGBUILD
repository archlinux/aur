# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Riley Trautman <asonix@tamu.edu>

pkgname=pantheon-mail
_gname=mail
pkgver=1.0.8
pkgrel=1
pkgdesc='The Pantheon Mail Client'
arch=('i686' 'x86_64')
url='https://github.com/elementary/mail'
license=('GPL3')
depends=('cairo' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc' 'gmime' 'gtk3'
         'libaccounts-glib' 'libcanberra' 'libgee' 'libgsignon-glib'
         'libsecret' 'libxml2' 'pango' 'sqlite' 'webkitgtk')
makedepends=('cmake' 'git' 'gnome-doc-utils' 'gobject-introspection'
             'granite' 'intltool' 'vala')
replaces=('pantheon-mail-bzr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3a1493832cbde0d004238197f2ddccbedfa8cdb79fe8017d5e32e9ffab7e9ee9')

build() {
  mkdir -p $_gname-$pkgver/build
  cd $_gname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDESKTOP_UPDATE=FALSE \
    -DGSETTINGS_COMPILE=FALSE \
    -DGSETTINGS_COMPILE_IN_PLACE=FALSE

  make
}

package() {
  cd $_gname-$pkgver/build

  make DESTDIR="$pkgdir" install
}
