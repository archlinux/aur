# Maintainer: Allison Smith <a1yk@tilde.green>
_pkgname=merkaartor
pkgname=$_pkgname-qt6-git
pkgver=0.19.0.r133.g5bd9cf7b
pkgrel=2
pkgdesc='Merkaartor openstreetmap mapping program. Qt6 build'
url='http://www.merkaartor.be/'
arch=('i686' 'x86_64')
license=('GPL-2.0')
depends=('qt6-5compat' 'qt6-svg' 'gdal' 'hicolor-icon-theme')
makedepends=('qt6-tools' 'git')
source=("git+https://github.com/openstreetmap/${_pkgname}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  cmake . \
        -DQT_DIR=/usr/lib/cmake/Qt6
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

