# Maintainer: Srevin Saju <srevin03@gmail.com> 

pkgname=sugar-toolkit-gtk3-git
pkgver=0.116.g
pkgrel=5
pkgdesc="Sugar GTK library"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
depends=('alsa-lib' 'gtk3' 'libsm' 'python-cairo' 'python-dateutil' 'python-decorator'
         'python-six' 'python2-telepathy' 
         'telepathy-mission-control' 'unzip')
makedepends=('intltool' 'gobject-introspection')
source=('git+https://github.com/sugarlabs/sugar-toolkit-gtk3.git')
sha256sums=('SKIP')


build() {
  cd sugar-toolkit-gtk3-$pkgver
  # Disable hardened build until fixed upstream
  # https://bugs.sugarlabs.org/ticket/4886
  export CFLAGS=${CFLAGS/ -fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./autogen.sh --prefix=/usr --with-python3
}
package() {
  cd sugar-toolkit-gtk3-$pkgver
  make DESTDIR="$pkgdir" install
}
