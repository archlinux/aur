# Maintainer: Srevin Saju <srevin03@gmail.com> 

pkgname=sugar-toolkit2-gtk3-git
pkgver=0.116.g
pkgrel=1
pkgdesc="Sugar GTK library"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
depends=('sugar-toolkit-gtk3' 'alsa-lib' 'gtk3' 'libsm' 'python2-cairo' 'python2-dateutil' 'python2-decorator'
         'python2-six' 'python2-telepathy' 'telepathy-mission-control' 'unzip')
makedepends=('intltool' 'gobject-introspection')
source=('git+https://github.com/sugarlabs/sugar-toolkit-gtk3.git')
sha256sums=('SKIP')

build() {
  cd sugar-toolkit-gtk3-$pkgver
  # Disable hardened build until fixed upstream
  # https://bugs.sugarlabs.org/ticket/4886
  export PYTHON=python2
  export CFLAGS=${CFLAGS/ -fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./autogen.sh --prefix=/usr --with-python2

}
package() {
  cd sugar-toolkit-gtk3-$pkgver
  make DESTDIR="$pkgdir" install
  
  # remove unnecessary files (or files installed by python3-sugar)
  rm $pkgdir/usr/bin/*
  rm $pkgdir/usr/share/locale/*/LC_MESSAGES/*.mo
  rm $pkgdir/usr/lib/girepository-1.0/SugarExt-1.0.typelib
  rm $pkgdir/usr/lib/girepository-1.0/SugarGestures-1.0.typelib
  rm $pkgdir/usr/lib/libsugar-eventcontroller.so
  rm $pkgdir/usr/lib/libsugar-eventcontroller.so.0
  rm $pkgdir/usr/lib/libsugar-eventcontroller.so.0.0.0
  rm $pkgdir/usr/lib/libsugarext.so
  rm $pkgdir/usr/lib/libsugarext.so.0
  rm $pkgdir/usr/lib/libsugarext.so.0.0.0
  rm $pkgdir/usr/share/gir-1.0/SugarExt-1.0.gir
  rm $pkgdir/usr/share/gir-1.0/SugarGestures-1.0.gir

}


