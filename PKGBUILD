# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=mediaelch-git
pkgver=v2.8.0.r44.g136f4fc1
pkgrel=1
pkgdesc='MediaElch is a MediaManager for Kodi'
url='https://www.mediaelch.de/mediaelch/'
arch=('x86_64')
license=('LGPL3')
depends=('libmediainfo' 'qt5-declarative' 'qt5-multimedia' 'qt5-script' 'quazip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Komet/MediaElch.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init
  mkdir build && cd $_
  qmake ..
  make -j4
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make INSTALL_ROOT="${pkgdir}" install
}

