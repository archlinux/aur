# Maintainer: effeffe - Filippo Falezza <filippo dot falezza at outlook dot com>

pkgname=cyusb_linux
pkgver=git
pkgrel=1
url="https://github.com/Ho-Ro/cyusb_linux"
arch=('i686' 'x86_64')
license=('unknown')
depends=()
source=(
  'git+https://github.com/Ho-Ro/cyusb_linux.git'
  'Makefile.patch'
)
md5sums=(
  'SKIP'
  'SKIP'
)

build() {
  cd ${srcdir}/${pkgname}
#  patch -Np3 < ${srcdir}/Makefile.patch
  make all
  touch cyusb
}

package() {
  cd ${srcdir}/${pkgname}
  install -D -m644 lib/libcyusb.so.1 $pkgdir/usr/local/lib/libcyusb.so.1
  install -D configs/cy_renumerate.sh $pkgdir/usr/local/bin/cy_renumerate.sh
  install -D bin/cyusb $pkgdir/usr/local/bin/cyusb
  install -D -m644 configs/cyusb.conf $pkgdir/etc/cyusb.conf
  install -D -m644 configs/88-cyusb.rules $pkgdir/etc/udev/rules.d/88-cyusb.rules
  install -D -m644 cyusb $pkgdir/etc/profile.d/cyusb
  echo "# Cypress USB Suite: Root directory" > $pkgdir/etc/profile.d/cyusb
  echo "export CYUSB_ROOT=`pwd`" >> $pkgdir/etc/profile.d/cyusb
  cd $pkgdir/usr/local/lib
  ln -sf libcyusb.so.1 libcyusb.so
}
