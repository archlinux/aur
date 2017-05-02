# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=rofi-file_browser-git
_gitname=rofi-file_browser
pkgver=r5.6af50e0
pkgrel=1
pkgdesc="A plugin for rofi that is a file browser"
arch=('i686' 'x86_64')
url="https://gitcrate.org/qtools/rofi-file_browser"
license=('MIT')
depends=(rofi-git)
options=('!libtool')
makedepends=('git')
provides=('rofi-file_browser')
source=("git+https://gitcrate.org/qtools/rofi-file_browser.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  autoreconf --install

  # Default compiler = clang, which can be a problem if using hardening-wrapper
  CC=gcc ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"
}

