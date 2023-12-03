# Maintainer: Alexander Konarev (avkonarev) <AVKonarev@gmail.com>
# Author: Fritz Webering (fritzw)

pkgname=ld_preload_open
pkgver=1
pkgrel=1
pkgdesc="This library can trick a process into opening absolute paths from a different location, similar to bind mounts, but without root access"
arch=('i686' 'x86_64')
url="https://github.com/fritzw/ld-preload-open"
license=('MIT')
arch=('x86_64')
source=("git+https://github.com/fritzw/ld-preload-open")
sha256sums=('SKIP')

makedepends=('gcc' 'ruby-ronn-ng' 'gzip')

build(){
  cd $srcdir/ld-preload-open
  make all
  ronn README.md
  gzip -c README > ld_preload_open.1.gz
}

package() {
    cd $srcdir/ld-preload-open
    mkdir -p $pkgdir/usr/lib/ld-preload-open
    cp *.so $pkgdir/usr/lib/ld-preload-open
    mkdir -p $pkgdir/usr/share/licenses
    cp LICENSE $pkgdir/usr/share/licenses
    mkdir -p $pkgdir/usr/share/man/man1
    cp ld_preload_open.1.gz $pkgdir/usr/share/man/man1
}
