# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=qt5-gtkplatform
pkgname=$_pkgname-git
pkgver=0.2.4.r11.g1149f4f
pkgrel=1
pkgdesc="Run Qt applications using GTK+ as a windowing system"
arch=('x86_64')
depends=('qt5-base' 'gtk3' 'libnotify')
makedepends=('make')
url="https://github.com/CrimsonAS/gtkplatform"
license=('GPL2' 'GPL3' 'LGPL3' 'custom')
source=(${_pkgname}::git+https://github.com/CrimsonAS/gtkplatform.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  qmake
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make INSTALL_ROOT="$pkgdir/" DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
