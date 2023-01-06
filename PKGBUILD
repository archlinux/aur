# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrAppleXZ

pkgname=gtk-sharp-3-git
pkgver=2.99.3.r76.gdadc19cf1
pkgrel=1
pkgdesc="C# bindings for GTK+ 3, built from sources."
arch=(x86_64)
url="https://www.mono-project.com/docs/gui/gtksharp/"
license=(GPL2)
depends=(mono gtk3)
makedepends=(git)
provides=(gtk-sharp-3)
conflicts=(gtk-sharp-3)
source=("git+https://github.com/mono/gtk-sharp.git")
sha256sums=('SKIP')

pkgver() {
  cd gtk-sharp
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gtk-sharp
  ./autogen.sh --prefix=/usr
}

build() {
  cd gtk-sharp
  make
}

package() {
  cd gtk-sharp
  make DESTDIR="$pkgdir" install
}
