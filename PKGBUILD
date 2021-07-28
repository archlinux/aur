# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=ipcalc-redhat
pkgver=1.0.1
pkgrel=1
pkgdesc="Redhat's modernized ipcalc fork with IPv6 support"
arch=('x86_64')
url="https://gitlab.com/ipcalc/ipcalc"
license=('GPL')
conflicts=('ipcalc')
depends=('glibc')
makedepends=('meson' 'ruby-ronn')
source=("https://gitlab.com/ipcalc/ipcalc/-/archive/${pkgver}/ipcalc-${pkgver}.tar.gz")
sha256sums=('60c21355fc74e6c8d4ef926bd992fcb36238d70d98aaa8e80f5b66375c9beee9')

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
