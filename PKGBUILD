# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Contributor: Albert De La Fuente Vigliotti
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: vonpupp
# alerque
# haawda

pkgname=xiphos-git
_pkgname="${pkgname%-git}"
pkgver=4.3.2.r55.g0717570
pkgrel=1
pkgdesc='A Bible study tool for GTK3'
arch=(x86_64)
url='https://xiphos.org'
license=(GPL-2.0-only)
depends=('biblesync' 'dbus-glib' 'icu' 'libbiblesync.so' 'libicui18n.so'
         'minizip' 'speech-dispatcher' 'sword' 'webkit2gtk-4.1')
makedepends=('appstream' 'appstream-glib' 'cmake' 'git' 'glib2-devel' 'gnome-common'
             'intltool' 'libffi' 'libxml2' 'python' 'zlib' 'zip')
source=("git+https://github.com/crosswire/xiphos.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --tags --abbrev=7 --match="[0-9]*" HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DEPUB=OFF \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
