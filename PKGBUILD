_pkgname=merkaartor
pkgname=$_pkgname-git
pkgver=0.18.1.r144.gdcebd61
pkgrel=1
pkgdesc='Merkaartor openstreetmap mapping program'
url='http://www.merkaartor.be/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-svg' 'gdal' 'qt5-webkit' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('qt5-tools' 'git')
install="$pkgname.install"
source=("git+https://github.com/openstreetmap/${_pkgname}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  lrelease-qt5 src/src.pro
  qmake-qt5 -r PREFIX='/usr'
  make release
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
