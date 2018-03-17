# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=notes-up-git
pkgver=1.5.2.r9.g855d213
pkgrel=1
pkgdesc="Notes Up is a notes manager written for elementary OS"
arch=('x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('discount' 'gtksourceview3' 'gtkspell3' 'libgranite.so' 'webkit2gtk')
makedepends=('cmake' 'git' 'vala>=0.39.0')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../"${pkgname%-*}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dnoele=1
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
