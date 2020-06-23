# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-core-c-git
pkgver=0.12.3.r38.ge70d90d
pkgrel=1
pkgdesc="EditorConfig core library written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-core-c"
license=('BSD')
depends=('glibc' 'pcre2')
makedepends=('git' 'cmake')
provides=('editorconfig-core-c')
conflicts=('editorconfig-core-c')
source=('git+https://github.com/editorconfig/editorconfig-core-c.git')
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-core-c"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "editorconfig-core-c"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DINSTALL_HTML_DOC=ON \
    "../"
  make
}

package() {
  cd "editorconfig-core-c"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/editorconfig-core-c"
}
