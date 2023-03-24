# Maintainer: Bart Libert <aur@bart.libert.email>
_pkgname=gtk-print
pkgname=$_pkgname-git
pkgver=r23.97163dd
pkgrel=1
pkgdesc=' A CLI utility to conjure up gtk-based print dialogs '
arch=(x86_64)
url='https://github.com/nbfalcon/gtk-print'
license=(MIT)
provides=(gtk-print)
depends=(glibc poppler-glib glib2 gtk3)
makedepends=(git meson)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
