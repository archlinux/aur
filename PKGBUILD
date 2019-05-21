# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>
# Contributor: Valentin Huélamo (birdtray.desktop)

pkgname=birdtray
pkgver=1.6
_commit=2ad1a944dcd084ff1ea874b94d07be2bb8a77c18
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL')
depends=(qt5-x11extras sqlite3)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${_commit}.tar.gz"
        birdtray.desktop)
sha1sums=('6996de307b48627df9b40c7dedef6a7e34e7cec7'
          'f3398822d8cf6671f06b5e065b623083294d6f11')

build() {
  mkdir -p build && cd build
  qmake-qt5 ../$pkgname-$_commit/src
  make
}

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/birdtray
  install -d "$pkgdir"/usr/include/birdtray
  install -d "$pkgdir"/usr/share/applications

  install birdtray.desktop "$pkgdir"/usr/share/applications/birdtray.desktop
  install build/birdtray   "$pkgdir"/usr/bin/birdtray
  install -m644 build/*.o  "$pkgdir"/usr/lib/birdtray/
  install -m644 build/*.h  "$pkgdir"/usr/include/birdtray/
}
