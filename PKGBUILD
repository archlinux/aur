# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xiphos-git
pkgver=4.1.0.r85.gf134af4
pkgrel=1
epoch=1
pkgdesc='A Bible study tool for GTK3'
arch=('i686' 'x86_64')
url='http://xiphos.org'
license=('GPL2')
depends=('gtkhtml4'
         'libbiblesync.so'
         'libgsf'
         'sword>=1.8.1'
         'webkit2gtk')
makedepends=('appstream-glib'
             'cmake'
             'docbook-utils'
             'git'
             'gnome-common'
             'gnome-doc-utils'
             'gtkmm'
             'intltool'
             'libxml2'
             'python')
provides=('gnomesword' "${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+https://github.com/crosswire/xiphos.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cmake -S . -B build \
	-DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGTKHTML=ON
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="$pkgdir" install
}
