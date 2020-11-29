# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=gtk-sharp-2-git
pkgver=2.12.45.r48.ga915b2c67
pkgrel=1
pkgdesc="C# bindings for GTK+ 2"
arch=(any)
url="https://mono-project.com/GtkSharp"
license=(GPL)
depends=(mono gtk2 libglade)
makedepends=(git)
provides=(gtk-sharp-2)
conflicts=(gtk-sharp-2)
source=("git+https://github.com/mono/gtk-sharp.git#branch=gtk-sharp-2-12-branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gtk-sharp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gtk-sharp"
  ./bootstrap-2.12 --prefix=/usr
  make
}

package() {
  cd "$srcdir/gtk-sharp"
  make DESTDIR="$pkgdir" install
}
