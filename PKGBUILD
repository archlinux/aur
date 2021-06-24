# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=forklift-git
pkgver=r36.da760ae
pkgrel=1
pkgdesc='Simple GUI for youtube-dl using PyGObject'
arch=('any')
url='https://github.com/Johnn3y/Forklift'
license=('GPL3')
depends=('gtk3' 'libdazzle' 'libhandy0' 'python-gobject' 'youtube-dl')
makedepends=('appstream-glib' 'git' 'meson')
source=("git+https://github.com/Johnn3y/Forklift")
sha256sums=('SKIP')

pkgver() {
  cd Forklift
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson Forklift build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
