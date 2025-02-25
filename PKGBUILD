# Maintainer: Dein Name <deine.email@example.com>

pkgname=servicemaster-git
_pkgname=servicemaster
pkgver=0.1.r105.2e95b12
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Linux systemd administration tool with nice TUI written in C."
arch=('x86_64')
url="https://github.com/lennart1978/servicemaster"
license=('MIT')
depends=('ncurses' 'systemd-libs')
makedepends=('meson' 'ninja' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lennart1978/servicemaster.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  mkdir builddir
  meson setup builddir --buildtype=release --prefix=/usr/bin
  meson compile -C builddir
}

package() {
  cd "$_pkgname"
  sudo meson install -C builddir
}


