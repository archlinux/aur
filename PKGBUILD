# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org> 

pkgname=sugar-toolkit-gtk3-git
pkgver=v0.118.5.gdb642e14
pkgrel=1
pkgdesc="Sugar GTK library"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('LGPL')
depends=('alsa-lib' 'gtk3' 'libsm' 'python-cairo' 'python-dateutil' 'python-decorator'
         'python-six' 'sugar-artwork' 'sugar-datastore' 'telepathy-mission-control' 'unzip')
makedepends=('intltool' 'gobject-introspection')
optdepends=('webkit2gtk: run sugar-activity-web')
source=("git+https://github.com/sugarlabs/sugar-toolkit-gtk3.git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')


build() {
  cd "$srcdir/${pkgname%-git}"
  # Disable hardened build until fixed upstream
  # https://bugs.sugarlabs.org/ticket/4886
  export CFLAGS=${CFLAGS/ -fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./autogen.sh --prefix=/usr --with-python3
}
package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
