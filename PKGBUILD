# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

_name=divvydroid
pkgname=${_name}-git
pkgver=1.0
pkgrel=1
pkgdesc="Application to screencast and remote control Android devices (git version)"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${_name}"
license=('GPL')
depends=('qt5-base' 'ffmpeg' 'android-tools')
makedepends=('cmake' 'git')
conflicts=(${_name})
source=("git+https://github.com/maxrd2/${_name}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --always | sed 's|-|.|g' | sed -e 's/^v//g'
}

build() {
  cd ${srcdir}/${_name}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
	-DAPP_VERSION=${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}
  make DESTDIR=${pkgdir} install
}
