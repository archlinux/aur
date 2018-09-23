# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=birdtray-git
pkgver=latest
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL')
depends=(qt5-base sqlite3)
makedepends=(git)
conflicts=(${pkgname/-git/})
provides=(${pkgname/-git/})
source=("git+https://github.com/gyunaev/${pkgname/-git/}.git")
sha1sums=(SKIP)

build() {
  mkdir -p build && cd build
  qmake-qt5 ../${pkgname/-git/}/src
  make
}

package() {
  cd build

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/birdtray
  install -d "$pkgdir"/usr/include/birdtray

  install birdtray "$pkgdir"/usr/bin/birdtray
  install -m644 *.o "$pkgdir"/usr/lib/birdtray/
  install -m644 *.h "$pkgdir"/usr/include/birdtray/
}
