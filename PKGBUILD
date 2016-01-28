# Maintainer: Gerald Nunn <gerald dot b dot nunn at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=0.45.0.r1.70aed81
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('libnautilus-extension: for "open with terminix" support in nautilus')
makedepends=('git' 'dmd' 'dub')
provides=('terminix')
conflicts=('terminix')
install=$pkgname.install
source=('git+https://github.com/gnunn1/terminix')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  dub build --build=release
  cd data/resources
  glib-compile-resources terminix.gresource.xml
}

package() {
  cd "$_pkgname"
  ./install.sh $pkgdir/usr
  rm $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled 
}
