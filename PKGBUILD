# Maintainer: PancakeTAS <pancake@mgnet.work> 

pkgname=obs-ios-camera-source
pkgver=r290.c67e577
pkgrel=1
pkgdesc="Use your iPhone camera as a video source in OBS Studio and stream high quality video from your iPhone's camera over USB (dougg3's fork)"
arch=('x86_64')
license=('GPL2')
depends=('obs-studio' 'usbmuxd')
makedepends=('cmake')
source=("git+https://github.com/dougg3/$pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
}

prepare() {
  cd "$srcdir"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/$pkgname"
  make
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir/build/obs-ios-camera-source.so" usr/lib/obs-plugins/obs-ios-camera-source.so
  install -Dm644 "$srcdir/$pkgname/data/locale/en-US.ini" usr/share/obs/obs-plugins/obs-ios-camera-source/en-US.ini
}
