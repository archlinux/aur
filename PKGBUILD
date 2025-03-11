# Submitter: mtorromeo
# Maintainer: Bink

pkgname=qpress
pkgver=20230507
pkgrel=1
pkgdesc="qpress is a portable high-speed file archiver using QuickLZ designed to utilize fast storage systems"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/PierreLvx/qpress"
license=('GPL')
source=("https://github.com/PierreLvx/qpress/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5110929b93b415b4e1aa912cec8021f54787b38316e5906f104a086b763604e8')

build() {
  cd $startdir/src/qpress-$pkgver
  # Fix for isatty()
  sed -i 's|#include <sys/types.h>|#include <sys/types.h>\n  #include <unistd.h> // for isatty()|' qpress.cpp
  make
}

package(){
    install -d $pkgdir/usr/bin/
    install $startdir/src/qpress-$pkgver/qpress $pkgdir/usr/bin/
}
