# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=aasdk-git
_pkgname=aasdk
pkgver=1.0.rc2.r2.ga36db60
pkgrel=1
pkgdesc="Library to build AndroidAuto headunit"
arch=('x86_64')
url="https://github.com/f1xpl/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('cmake' 'protobuf' 'boost' 'libusb' 'openssl' 'git')
source=("$pkgname::git+https://github.com/f1xpl/aasdk.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  mkdir -p aasdk_build
  cd aasdk_build
  cmake -DCMAKE_BUILD_TYPE=Release ../  
  make
}

package() {
  mkdir -p "$pkgdir/opt/aasdk"
  cp -Rv $pkgname/* "$pkgdir/opt/aasdk/"
}
