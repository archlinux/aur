# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-core-c-git
pkgver=0.12.1.r13.g1f2c30e
pkgrel=1
pkgdesc='EditorConfig core library written in C (for use by plugins supporting EditorConfig parsing)'
url='https://github.com/editorconfig/editorconfig-core-c'
arch=('i686' 'x86_64')
license=('BSD')
depends=('pcre')
makedepends=('git' 'cmake>=2.8.7')
provides=('editorconfig-core-c')
conflicts=('editorconfig-core-c')
source=('git+https://github.com/editorconfig/editorconfig-core-c.git')
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-core-c"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "editorconfig-core-c"

  mkdir -p "build"
}

build() {
  cd "editorconfig-core-c/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" -DINSTALL_HTML_DOC=ON ../
  make
}

package() {
  cd "editorconfig-core-c/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/editorconfig-core-c/LICENSE"
}
