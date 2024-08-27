# Maintainer: PancakeTAS <pancake@mgnet.work> 

_pkgname=obs-ios-camera-source
pkgname=${_pkgname}-git
pkgver=r290.c67e577
pkgrel=2
pkgdesc="Use your iPhone camera as a video source in OBS Studio and stream high quality video from your iPhone's camera over USB (dougg3's fork)"
arch=('x86_64')
license=('GPL2')
depends=('obs-studio' 'usbmuxd')
makedepends=('cmake')
source=("git+https://github.com/dougg3/$_pkgname")
md5sums=('SKIP')
conflicts=('obs-plugin-ios-camera-source-git' 'obs-ios-camera-source')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

prepare() {
  cd "$srcdir"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/$_pkgname"
  make
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir/build/obs-ios-camera-source.so" usr/lib/obs-plugins/obs-ios-camera-source.so
  install -Dm644 "$srcdir/$_pkgname/data/locale/en-US.ini" usr/share/obs/obs-plugins/obs-ios-camera-source/en-US.ini
}
