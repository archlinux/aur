# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=txtreader
pkgname=$_pkgname-git
pkgver=r14.dc1f832
pkgrel=1
pkgdesc='Simple program for reading txt files (latest commit)'
url="https://github.com/alexkdeveloper/txtreader"
arch=('x86_64' 'aarch64')
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('gtk3')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
