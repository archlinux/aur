# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=ipcalc-redhat
pkgver=0.4.1
pkgrel=1
pkgdesc="Redhat's modernized ipcalc fork with IPv6 support"
arch=('x86_64')
url="https://gitlab.com/ipcalc/ipcalc"
license=('GPL')
conflicts=('ipcalc')
depends=('glibc')
makedepends=('meson')
source=("https://gitlab.com/ipcalc/ipcalc/-/archive/${pkgver}/ipcalc-${pkgver}.tar.gz")
sha256sums=('b68d795897f80fde4187aa9397abdd1cd651554e2327f6edb0406beefeb690ac')

build() {
  cd "$srcdir/ipcalc-$pkgver"
  meson setup build -Duse_maxminddb=disabled -Duse_geoip=disabled
  ninja -C build
}

package() {
    cd "$srcdir/ipcalc-$pkgver"
    install -m755 -Dt "${pkgdir}/usr/bin/" build/ipcalc
    install -m644 -Dt "${pkgdir}/usr/share/licenses/ipcalc/" COPYING
    install -m644 -Dt "${pkgdir}/usr/share/man/man1/" ipcalc.1
}
