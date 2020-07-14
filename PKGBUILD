# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Contributor: HoaS <:-)>
_pkgname=nwg-launchers
pkgname=$_pkgname-git
pkgver=r199.eaad654
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs (development version)"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'gtkmm3' 'nlohmann-json')
conflicts=('nwg-launchers')
source=('nwg-launchers::git+https://github.com/nwg-piotr/nwg-launchers#branch=master')
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$_pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/$_pkgname"
   meson builddir -Dbuildtype=release -Dprefix=/usr
   ninja -C builddir
}

package() {
   cd "$srcdir/$_pkgname"
   DESTDIR="$pkgdir" ninja -C builddir install
}

