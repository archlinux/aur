# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench
_pkgname=Workbench
pkgver=1.2.0
pkgrel=1
pkgdesc="Learn and prototype with GNOME technologies"
arch=('x86_64')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('libadwaita' 'glib2' 'gtksourceview5' 'gjs' 'vte4-git' 'libportal-gtk4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('b9e5382d6175a134d7bac570e44b3304fdc010f6d26c38a040d23a137742c858597f57dcf5649a82a105bc3fd0c0abc0cc7941a33fe007f67ee16eb25140f8f0')

prepare() {
   cd "$_pkgname-$pkgver"
   git submodule init
   git submodule update
   sed -i 's/\/app\//\/usr\//' src/re.sonny.Workbench
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
