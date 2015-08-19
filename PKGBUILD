# Maintainer: Ricardo Leuck <leuck.r at gmail>
pkgname=brewtarget-git
_pkgname=brewtarget
pkgver=2.1.0.r93.ga712259
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('GPL3'
         'WTFPL-2')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-svg' 'phonon')
optdepends=()
makedepends=('cmake' 'git')
conflicts=(brewtarget)
provides=(brewtarget)
backup=()
source=("git+https://github.com/Brewtarget/brewtarget.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING.GPLv3 "$pkgdir/usr/share/licenses/$_pkgname/COPYING.GPLv3"
}
