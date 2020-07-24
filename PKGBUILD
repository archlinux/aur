pkgname=hydroid-git
pkgver=1.0.0.alpha1.r0.gb737561
pkgrel=1
pkgdesc="A Hydrus client."
arch=('i686' 'x86_64')
url="https://github.com/thatfuckingbird/hydroid"
license=('AGPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-imageformats')
makedepends=('qt5-tools')
provides=('hydroid')
source=("$pkgname"::"git+https://github.com/thatfuckingbird/hydroid.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
 cd "$srcdir/$pkgname"
 make INSTALL_ROOT=${pkgdir} install
 install -Dm644 "distrib/linux/icon.png" "${pkgdir}/usr/share/icons/hydroid.png"
 install -Dm644 "distrib/linux/hydroid.desktop" "${pkgdir}/usr/share/applications/hydroid.desktop"
}
