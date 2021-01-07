# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=ipcalc-redhat
pkgver=1.0.0
pkgrel=1
pkgdesc="Redhat's modernized ipcalc fork with IPv6 support"
arch=('x86_64')
url="https://gitlab.com/ipcalc/ipcalc"
license=('GPL')
conflicts=('ipcalc')
depends=('glibc')
makedepends=('meson' 'ruby-ronn')
source=("https://gitlab.com/ipcalc/ipcalc/-/archive/${pkgver}/ipcalc-${pkgver}.tar.gz")
sha256sums=('4d945beec973930177156ee0dc696861317d7cbeaf65144df888ced7e7190fca')

build() {
  cd "$srcdir/ipcalc-$pkgver"
  meson setup build -Duse_maxminddb=disabled -Duse_geoip=disabled
  ninja -C build
}

package() {
    cd "$srcdir/ipcalc-$pkgver"
    install -m755 -Dt "${pkgdir}/usr/bin/" build/ipcalc
    install -m644 -Dt "${pkgdir}/usr/share/licenses/ipcalc/" COPYING
    install -m644 -Dt "${pkgdir}/usr/share/man/man1/" build/ipcalc.1
}
