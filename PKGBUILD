# Maintainer: Lennart Martens  <monkeynator78@gmail.com>

pkgname=servicemaster-git
_pkgname=servicemaster
pkgver=1.7.4.r162.f07e5ec
pkgrel=1
pkgdesc="Linux Systemd administration tool with nice TUI written in C."
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
  printf "1.7.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson build $_pkgname
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
