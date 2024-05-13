# Maintainer: willemw <willemw12@gmail.com>
# Contributor: boenki <boenki at gmx dot de>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=jeex
pkgver=12.6.1
pkgrel=6
pkgdesc='Simple GTK+ hex editor'
arch=(x86_64)
#url=http://www.hds619.net/jeex.php
url=http://sourceforge.net/projects/slackbuildsdirectlinks/files/jeex
license=(GPL3)
depends=(gtk2)
#backup=(etc/jeex.rc)
source=("https://sourceforge.net/projects/slackbuildsdirectlinks/files/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('2e7fb88fad942a745a5daacbac34600182472488a3632802c52099a973027178')

_srcdir=$pkgname-${pkgver:0:4}

# Workaround for GCC
export CFLAGS="$CFLAGS -fcommon -Wno-implicit-function-declaration"

build() {
  cd $_srcdir
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  make -C $_srcdir check
}

package() {
  make -C $_srcdir DESTDIR="$pkgdir/" install
}
