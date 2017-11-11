# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=notes-up-git
pkgver=1.4.7.r26.gd6bf17b
pkgrel=1
pkgdesc="Notes Up is a notes manager written for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('gtksourceview3' 'gtkspell3' 'libgranite.so' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd Notes-up
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../Notes-up -Dnoele=1 -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
