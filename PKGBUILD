# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=openauto-git
_pkgname=openauto
pkgver=640c0c6
pkgrel=1
pkgdesc="AndroidAuto headunit emulator"
arch=('x86_64')
url="https://github.com/f1xpl/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('qt5-connectivity' 'qt5-multimedia' 'pulseaudio' 'gst-libav')
makedepends=('aasdk-git' 'git')
source=("$pkgname::git+https://github.com/f1xpl/openauto.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p openauto_build
  cd openauto_build
  cmake -DCMAKE_BUILD_TYPE=Release -DRPI3_BUILD=FALSE -DAASDK_INCLUDE_DIRS="/opt/aasdk/include" -DAASDK_LIBRARIES="/opt/aasdk/lib/libaasdk.so" -DAASDK_PROTO_INCLUDE_DIRS="/opt/aasdk/aasdk_build" -DAASDK_PROTO_LIBRARIES="/opt/aasdk/lib/libaasdk_proto.a" ../ 
  make
}

package() {
  mkdir -p "$pkgdir/opt/openauto/"
  cp -Rv $pkgname/* "$pkgdir/opt/openauto/"
  install -D -m755 ../autoapp.sh "$pkgdir/usr/bin/autoapp"
}
